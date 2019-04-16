package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Toast;

public class TrackExportStarter {
    public static final String TAG = "mifit";
    private AppCompatActivity activity;

    public TrackExportStarter(AppCompatActivity activity) {
        this.activity = activity;
    }

    // find DB path

    // read track ids

    // call track exporter with raw query data

    public void K_showTracks() {
        DBConnector dbConnector1 = new DBConnector(activity);
        String databaseFullName1 = dbConnector1.getDbPath();
        if (databaseFullName1 == null) {
            Toast.makeText(activity, "database path is null", Toast.LENGTH_SHORT).show();
        } else {
            SQLiteDatabase sqLiteDatabase = activity.openOrCreateDatabase(databaseFullName1, Context.MODE_PRIVATE, null);

            Cursor cursor = sqLiteDatabase.rawQuery("" +
                    "   SELECT datetime(TRACKDATA.TRACKID, 'unixepoch', 'localtime'),\n" +
                    "       TRACKDATA.TYPE,\n" +
                    "       TRACKRECORD.DISTANCE,\n" +
                    "       TRACKRECORD.COSTTIME\n" +
                    "       FROM TRACKDATA, TRACKRECORD\n" +
                    "       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;", null);

            StringBuilder stringBuilder = new StringBuilder();
            while (!cursor.isAfterLast()) {
                for (int i = 0; i < cursor.getColumnCount(); i++) {
                    stringBuilder.append(cursor.getString(i)).append("\n");
                }
                cursor.moveToNext();
                Log.d("mifit", stringBuilder.toString());
            }

            cursor.close();
            sqLiteDatabase.close();

            Toast.makeText(activity, stringBuilder.toString(), Toast.LENGTH_SHORT).show();

//        ChooseTrackClickListener trackChooseListener = new ChooseTrackClickListener(activity, new String[]{"1a", "2a"});

//        AlertDialog.Builder alert = new AlertDialog.Builder(activity);
//        alert.setTitle("title");
//        alert.setItems(arrayList.toArray(new String[arrayList.size()]), trackChooseListener);
//        alert.create().show();
        }
    }
}
