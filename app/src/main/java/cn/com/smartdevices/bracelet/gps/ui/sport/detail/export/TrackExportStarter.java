package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Toast;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackHeader;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class TrackExportStarter {
    public static final String TAG = "mifit";
    private AppCompatActivity activity;
    private String dbPath;
    private static final String TRACK_ID_QUERY = "   SELECT TRACKRECORD.TRACKID," +
            "       TRACKDATA.TYPE," +
            "       TRACKRECORD.DISTANCE," +
            "       TRACKRECORD.COSTTIME" +
            "       FROM TRACKDATA, TRACKRECORD" +
            "       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;";

    private static final String TRACK_DATA_QUERY =
            "SELECT " +
                    "TRACKDATA.TRACKID," +
                    "TRACKDATA.SIZE," +
                    "TRACKDATA.BULKLL," +
                    "TRACKDATA.BULKGAIT," +
                    "TRACKDATA.BULKAL," +
                    "TRACKDATA.BULKTIME," +
                    "TRACKDATA.BULKHR," +
                    "TRACKDATA.BULKPACE," +
                    "TRACKDATA.BULKPAUSE," +
                    "TRACKDATA.BULKSPEED," +
                    "TRACKDATA.TYPE," +
                    "TRACKDATA.BULKFLAG," +
                    "TRACKRECORD.COSTTIME," +
                    "TRACKRECORD.ENDTIME, " +
                    "TRACKRECORD.DISTANCE " +
                    "FROM TRACKDATA, TRACKRECORD " +
                    "WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID " +
                    "AND TRACKDATA.TRACKID = ";

    public TrackExportStarter(AppCompatActivity activity) {
        this.activity = activity;
        DBHelper dbHelper = new DBHelper(activity);
        dbPath = dbHelper.getDbPath();
    }

    public void showTracks() {
        if (dbPath == null) {
            Toast.makeText(activity, "database not found", Toast.LENGTH_SHORT).show();
        } else {
            try (
                    SQLiteDatabase sqLiteDatabase = activity.openOrCreateDatabase(dbPath, Context.MODE_PRIVATE, null);
                    Cursor cursor = sqLiteDatabase.rawQuery(TRACK_ID_QUERY, null);
            ) {
                cursor.moveToFirst();
                Map<Long, TrackHeader> trackHeaderMap = new TreeMap<>();
                StringBuilder stringBuilder = new StringBuilder();
                while (!cursor.isAfterLast()) {
                    for (int i = 0; i < cursor.getColumnCount(); i++) {
                        stringBuilder.append(cursor.getString(i)).append(" ");
                    }
                    stringBuilder.append("\n");

                    TrackHeader trackHeader = new TrackHeader();
                    long trackId = cursor.getLong(0);
                    trackHeader.id = trackId;
                    trackHeader.type = cursor.getInt(1);
                    trackHeader.distance = cursor.getInt(2);
                    trackHeader.duration = cursor.getInt(3);
                    trackHeaderMap.put(trackId, trackHeader);
                    cursor.moveToNext();
                }
                cursor.close();
                sqLiteDatabase.close();

                Log.d(TAG, stringBuilder.toString());
                Toast.makeText(activity, stringBuilder.toString(), Toast.LENGTH_SHORT).show();

                ArrayList<Long> trackIds = new ArrayList<>();
                String[] trackDesc = new String[trackHeaderMap.size()];
                Set<Map.Entry<Long, TrackHeader>> entries = trackHeaderMap.entrySet();
                int i = 0;
                for (Map.Entry<Long, TrackHeader> entry : entries) {
                    trackIds.add(entry.getKey());
                    trackDesc[i] = entry.getValue().toString();
                    i++;
                }

                ChooseTrackClickListener trackChooseListener = new ChooseTrackClickListener(this, trackIds);

                AlertDialog.Builder alert = new AlertDialog.Builder(activity);
                alert.setTitle("title");
                alert.setItems(trackDesc, trackChooseListener);
                alert.create().show();
            } catch (Exception e) {
                Log.e(TAG, "showTracks():" + e.getMessage());
            }
        }
    }

    public void readRawDataWithId(long id) {
        try (SQLiteDatabase sqLiteDatabase = activity.openOrCreateDatabase(dbPath, Context.MODE_PRIVATE, null);
             Cursor cursor = sqLiteDatabase.rawQuery(TRACK_DATA_QUERY + id, null);
             ) {
            cursor.moveToFirst();
            // TODO: 2019-04-16 read data to rawtrackdata and call export


        } catch (Exception e) {
            Log.e(TAG, "readRawDataWithId(" + id + "):" + e.getMessage());
        }
    }
}
