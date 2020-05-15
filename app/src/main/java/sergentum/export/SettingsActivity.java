package sergentum.export;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceActivity;
import android.preference.PreferenceManager;
import android.util.Log;
import org.json.JSONObject;

import sergentum.sync.Response;
import sergentum.sync.Synchronizer.RequestMethod;
import sergentum.util.FormValues;
import sergentum.util.SyncHelper;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

import static sergentum.export.Starter.EXT_DB_NAME;
import static sergentum.export.Starter.TAG;
import static sergentum.util.HttpUtil.parseKVP;

public class SettingsActivity extends PreferenceActivity {
    private SharedPreferences sp;
    private Starter starter;

    private static final String PUBLIC_URL = "https://www.endomondo.com";
    private static final String AUTH_URL = "https://api.mobile.endomondo.com/mobile/auth";
    private static final String UPLOAD_URL = "https://api.mobile.endomondo.com/mobile/track";
    private static final String FEED_URL = "https://api.mobile.endomondo.com/mobile/api/feed";

    public static String ENDOMONDO_APIKEY = "endomondo_apikey";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        int identifier = getResources().getIdentifier("preferences", "layout", getPackageName());
        Log.d(TAG, "preferences: " + identifier);
        addPreferencesFromResource(identifier);

        sp = PreferenceManager.getDefaultSharedPreferences(this);
        starter = new MifitStarter(this);

        addAuthToggleListener();
    }

    private void addAuthToggleListener(){
        Preference endomondo_check = findPreference("endomondo_check");
        if (endomondo_check != null) {
            endomondo_check.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
                @Override
                public boolean onPreferenceChange(Preference preference, Object newValue) {
                    boolean allowToggle = false;
                    boolean toggle = (boolean) newValue;
                    if (toggle) {
                        // user tries to log in and enable synchronization
                        Response response = new Response();
                        try {
                            // TODO: 2019-07-31 fix deviceId and other pairing parameters

                            Map<String, String> params = new HashMap<>();
                            params.put("endomondo_login", sp.getString("endomondo_login", null));
                            params.put("endomondo_password", sp.getString("endomondo_password", null));
                            params.put("deviceId", sp.getString("deviceId", "deviceId"));
                            AuthTask authTask = new AuthTask(params);

                            FutureTask<Response> future = new FutureTask<>(authTask);
                            new Thread(future).start();

                            response = future.get();
                        } catch (Exception e) {
                            Log.e(TAG, "Can't get authToken from AuthTask");
                            e.printStackTrace();
                        }

                        if (response.result) {
                            sp.edit().putString(ENDOMONDO_APIKEY, response.apikey).apply();
                            // TODO: 2019-10-24 don't store password
//                            sp.edit().putString("endomondo_password", "").apply();
                            allowToggle = true;
                        }
                        Log.i(TAG, "" + response.message);
                        starter.showToast(response.message, 1);
                    } else {
                        // user tries to disable sync
                        Log.i(TAG, "synchronization disabled, apikey removed");
                        sp.edit().putString(ENDOMONDO_APIKEY, "apikey").apply();
                        allowToggle = true;
                    }

                    return allowToggle;
                }
            });
        }
    }

    static class AuthTask implements Callable<Response> {
        private Map<String, String> params;

        AuthTask(Map<String, String> params) {
            this.params = params;
        }

        @Override
        public Response call() {
            Response response = new Response();
            try {
                FormValues kv = new FormValues();
                String endomondo_login = params.get("endomondo_login");
                String endomondo_password = params.get("endomondo_password");
                if (endomondo_login == null || endomondo_login.isEmpty()) {
                    if (endomondo_password == null || endomondo_password.isEmpty()) {
                        response.message = "login or password is empty";
                        return response;
                    }
                }
                kv.put("email", endomondo_login);
                kv.put("password", endomondo_password);
                kv.put("v", "2.4");
                kv.put("action", "pair");
                kv.put("deviceId", params.get("deviceId"));
                kv.put("country", "N/A");

                HttpURLConnection conn = null;
                conn = (HttpURLConnection) new URL(AUTH_URL).openConnection();
                conn.setDoOutput(true);
                conn.setRequestMethod(RequestMethod.POST.name());
                conn.addRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                SyncHelper.postData(conn, kv);

                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                JSONObject res = parseKVP(in);
                conn.disconnect();

                int responseCode = conn.getResponseCode();
                String amsg = conn.getResponseMessage();
                if (responseCode == HttpURLConnection.HTTP_OK &&
                        "OK".contentEquals(res.getString("_0")) &&
                        res.has("authToken")
                ) {
                    response.apikey = res.getString("authToken");
                    response.result = true;
                    response.message = "Successfully logged in";
                } else {
                    response.result = false;
                    response.message = "Can't log in: " + res;
                }
            } catch (Exception e) {
                Log.e(TAG, "Exception occurred while connecting: ", e);
            }
            return response;
        }
    }

    private void copyDb() {
        if (starter instanceof MifitStarter) {
            String originDb = ((MifitStarter) starter).findOriginDb();
            String s = Starter.getFullPath() + EXT_DB_NAME;
            try {
                copyFileUsingStream(originDb, s);
                System.out.println("Origin DB successfully copied");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private static void copyFileUsingStream(String source, String dest) throws IOException {
        try (InputStream is = new FileInputStream(source);
             OutputStream os = new FileOutputStream(dest)
        ) {
            byte[] buffer = new byte[1024];
            int length;
            while ((length = is.read(buffer)) > 0) {
                os.write(buffer, 0, length);
            }
        }
    }
}
