package sergentum.sync;

import android.os.StrictMode;
import android.util.Log;
import org.json.JSONException;
import org.json.JSONObject;
import sergentum.export.Starter;
import sergentum.export.core.Model;
import sergentum.export.core.Model.ActivityType;
import sergentum.export.core.Printer;
import sergentum.runner.DefSynchronizer;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.StringWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.GZIPOutputStream;

import static sergentum.export.Starter.TAG;
import static sergentum.export.Starter.getDebugPath;
import static sergentum.export.core.Model.ActivityType.CYCLING;
import static sergentum.export.core.Model.ActivityType.RUNNING;
import static sergentum.export.core.Model.ActivityType.TREADMILL;
import static sergentum.export.core.Model.ActivityType.WALKING;
import static sergentum.util.HttpUtil.parseKVP;

public class EndomondoSyncronizer extends Synchronizer {
    private static final String UPLOAD_URL = "https://api.mobile.endomondo.com/mobile/track";

    private String authToken;
    private Starter starter;

    public EndomondoSyncronizer(String authToken, Starter starter) {
        this.authToken = authToken;
        this.starter = starter;
    }


    private static final Map<ActivityType, Integer> sport2endo = new HashMap<>();
    static {
        //list of sports ID can be found at
        // https://github.com/isoteemu/sports-tracker-liberator/blob/master/endomondo/workout.py
        sport2endo.put(null, 22);
        sport2endo.put(RUNNING, 0);
        sport2endo.put(CYCLING, 2);
        sport2endo.put(WALKING, 18);
        sport2endo.put(TREADMILL, 88);
    }


    public Status upload(Model.Track track) {
        // TODO: 2019-10-26 move internet activity to another thread
        StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
        StrictMode.setThreadPolicy(policy);

        Status status = Status.ERROR;
        String trackDesc = track.summary.toString();

        if (authToken == null || authToken.isEmpty()) {
            status = Status.NEED_AUTH;
            status.message = "Please check Endomondo authorization in the settings";
            return status;
        }

        HttpURLConnection conn;
//        Exception ex = null;
        try {
            StringWriter writer = new StringWriter();
            writer.write(Printer.printEndomondoTrack(track));
            StringBuilder url = new StringBuilder();
            url.append(UPLOAD_URL).append("?authToken=").append(authToken);
            url.append("&workoutId=").append(track.summary.startTime);
            url.append("&sport=").append(sport2endo.get(track.summary.activityType));
            url.append("&duration=").append(track.summary.duration);
            // distance in km is expected
            url.append("&distance=").append(((double) track.summary.distance) / 1000);

            /* todo can be implemented further
            if (track.hr != null) {
                url.append("&heartRateAvg=").append(summary.hr.toString());
            }
            */
            url.append("&gzip=true");
            url.append("&extendedResponse=true");

            if (starter.getDebug()) {
                String fileName = track.summary.startTime + "-" + track.summary.activityType + ".txt";
                String fullFilePath = getDebugPath() + fileName;
                starter.writeStringToFile(url.toString(), fullFilePath);
                starter.writeStringToFile(writer.getBuffer().toString(), fullFilePath);
            }

            conn = (HttpURLConnection) new URL(url.toString()).openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod(DefSynchronizer.RequestMethod.POST.name());
            conn.addRequestProperty("Content-Type", "application/octet-stream");
            OutputStream out = new GZIPOutputStream(new BufferedOutputStream(conn.getOutputStream()));
            out.write(writer.getBuffer().toString().getBytes());
            out.flush();
            out.close();

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            JSONObject jsonResponse = parseKVP(in);
            conn.disconnect();

            Log.e(TAG, "res: " + jsonResponse.toString());

            int responseCode = conn.getResponseCode();
            String responseMessage = conn.getResponseMessage();
            Log.d(TAG, "responseCode: " + responseCode);
            Log.d(TAG, "responseMessage: " + responseMessage);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                // http transmission was successful
                String endomondoMessage = jsonResponse.getString("_0");
                if ("OK".contentEquals(endomondoMessage)) {
                    // track was uploaded successfully
                    String string = jsonResponse.getString("workout.id");
                    if (!string.equalsIgnoreCase("null")) {
                        status = Status.OK;
                        status.message = trackDesc + "\n uploaded";
                    } else {
                        status = Status.SKIP;
                        status.message = trackDesc + "\n uploaded earlier";
                    }
                } else if ("AUTH_FAILED".equalsIgnoreCase(endomondoMessage)) {
                    status = Status.NEED_AUTH;
                    status.message = "Authorization failed, check the settings";
                } else {
                    status = Status.ERROR;
                    status.message = "There's some issue with track: " + track.summary.startTime;
                }
            } else {
                status = Status.FAIL;
                status.message = "Transmission FAILED\nHttpCode:" + responseCode + " Msg: " + responseMessage;
            }
        } catch (Exception e) {
            status.ex = e;
            status = Status.FAIL;
            status.message = "EndomondoSync FAIL \n" + e.getMessage();
        }
        if (status.ex != null) {
            Log.d(TAG, "" + status.ex.getMessage());
            status.ex.printStackTrace();
        }
        Log.d(TAG, "" + status.toConsoleString());

        return status;
    }
}
