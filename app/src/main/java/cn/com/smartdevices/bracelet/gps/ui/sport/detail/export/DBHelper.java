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

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.FileLogger;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackExporter;
import java.io.File;
import java.io.FileWriter;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.TAG;

class DBHelper {
    private static final String TMP_DB_QUERY = "" +
            "CREATE TABLE IF NOT EXISTS dummy " +
            "(\"_id\"  INTEGER primary key autoincrement, \n" +
            "  \"CALENDAR\" INTEGER )";

    private Context context;

    DBHelper(Context context) {
        this.context = context;
    }

    @TargetApi(Build.VERSION_CODES.M)
    private boolean checkStoragePermission() {
        int permissionCheckRead = ContextCompat.checkSelfPermission(context,
                Manifest.permission.WRITE_EXTERNAL_STORAGE);
        if (permissionCheckRead != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale((Activity) context,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE)) {
                ActivityCompat.requestPermissions((Activity) context,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 220);
            } else {
                ActivityCompat.requestPermissions((Activity) context,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                        220);
            }
            return false;
        } else
            return true;
    }

    String getDbPath() {
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

    private String checkExtDb() {
        String result = null;
        String mifit_dir_path = Environment.getExternalStorageDirectory().getPath() + "/" + TrackExporter.getFullPath();
        FileLogger.checkOrCreateFilePath(mifit_dir_path);
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

    private String findOriginDb() {
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
        SQLiteDatabase sqLiteDatabase = context.openOrCreateDatabase("tmp.db", Context.MODE_PRIVATE, null);
        sqLiteDatabase.execSQL(TMP_DB_QUERY);
        String path = sqLiteDatabase.getPath();
        Toast.makeText(context, path, Toast.LENGTH_SHORT).show();
        sqLiteDatabase.close();
        return path;
    }
}
