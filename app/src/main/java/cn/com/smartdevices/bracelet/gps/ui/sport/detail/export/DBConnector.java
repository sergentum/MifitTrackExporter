package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.Manifest;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.os.Build;
import android.os.Environment;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import android.widget.Toast;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackExporter;
import java.io.File;
import java.io.FileWriter;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.TAG;

public class DBConnector {
    private Context context;
    public SQLiteDatabase sqLiteDB;
//    public DBHelper dbHelper;

    public DBConnector(Context context) {
        this.context = context;
//        this.dbHelper = new DBHelper(context, dbName);
    }

    @TargetApi(Build.VERSION_CODES.M)
    public boolean checkStoragePermission() {
        int permissionCheckRead = ContextCompat.checkSelfPermission(context,
                Manifest.permission.WRITE_EXTERNAL_STORAGE);
        if (permissionCheckRead != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale((Activity) context,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE)) {
                // Show an expanation to the user *asynchronously* -- don't block
                // this thread waiting for the user's response! After the user
                // sees the explanation, try again to request the permission.
                ActivityCompat.requestPermissions((Activity) context,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 220);
            } else {
                // No explanation needed, we can request the permission.

                ActivityCompat.requestPermissions((Activity) context,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                        220);

                // MY_PERMISSIONS_REQUEST_READ_CONTACTS is an
                // app-defined int constant. The callback method gets the
                // result of the request.
            }
            return false;
        } else
            return true;
    }

    public String getDbPath() {
        String result = null;
        if (checkStoragePermission()) {
            Log.d(TAG, "storage write permission granted");
            result = checkExtDb();
            if (result == null) {
                result = findOriginDb();
            } else {
                Log.e(TAG, "db not found (ext or origin)");
            }
        }
        return result;
    }

    public String checkExtDb() {
        String result = null;
        String mifit_dir_path = Environment.getExternalStorageDirectory().getPath() + "/" + TrackExporter.getFullPath();
        File mifit_dir = new File(mifit_dir_path);
        Log.d(TAG, "search for local db in :" + mifit_dir_path);
        if (mifit_dir.exists()) {
            try {
                File file = new File(mifit_dir.getPath(), "test.txt");
                FileWriter fileWriter = new FileWriter(file);
                fileWriter.write("asdf");
                fileWriter.close();
                String[] list = mifit_dir.list();
                for (String fileName : list) {
                    File curFile = new File(mifit_dir_path, fileName);
                    if (!curFile.isDirectory() && curFile.getName().contains("origin.db")) {
                        result = curFile.getPath();
                        Log.d(TAG, "ext db found:" + result);
                        break;
                    }
                }
            } catch (Exception ex) {
                Log.e(TAG, ex.getMessage());
            }
        }
        return result;
    }

    public String findOriginDb() {
        String dbName = "origin_db";
        String dbJournal = "journal";
        String pathToDb = dbPathFinder();
        String result = null;
        File directory = new File(pathToDb);
        String[] list = directory.list();
        if (list != null) {
            for (String file : list) {
                directory = new File(pathToDb, file);
                File curFile = directory;
                if (!curFile.isDirectory() && curFile.getName().startsWith(dbName) && !curFile.getName().contains(dbJournal)) {
                    result = curFile.getPath();
                    Log.d(TAG, "origin db found:" + result);
                    break;
                }
            }
        }
        return result;
    }

    private String dbPathFinder() {
//        FileLogger fileLogger = new FileLogger();
//        String createCommand = " CREATE TABLE IF NOT EXISTS ";
//        String tableName = " tmpTable ";
//        String tableSchema = " (dummy1 INTEGER, dummy2 TEXT) ";
//
//        sqLiteDB.execSQL(createCommand + tableName + tableSchema);
//        File file = new File(sqLiteDB.getPath());
//        String result = file.getParent();
//        fileLogger.log("dbPathFinder :" + result);

        SQLiteDatabase sqLiteDatabase = context.openOrCreateDatabase("tmp.db", Context.MODE_PRIVATE, null);
        sqLiteDatabase.execSQL("create table IF NOT EXISTS dummy (" +
                "\"_id\"  INTEGER \n" +
                "    primary key \n" +
                "  autoincrement, \n" +
                "  \"CALENDAR\"                INTEGER" +
                ") ");
//        sqLiteDatabase.execSQL("insert into dummy (\"_id\", \"CALENDAR\") VALUES (1 , 2) ");
//            sqLiteDatabase.execSQL();
        String path = sqLiteDatabase.getPath();
        Toast.makeText(context, path, Toast.LENGTH_SHORT).show();
        sqLiteDatabase.close();


        return path;
    }
}
