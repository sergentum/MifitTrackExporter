package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Toast;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackExporter;
import java.io.File;
import java.io.FileWriter;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.FILE_HELPER;
import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.TAG;

class DBHelper {
    private static final String TMP_DB_QUERY = "" +
            "CREATE TABLE IF NOT EXISTS dummy " +
            "(\"_id\"  INTEGER primary key autoincrement, \n" +
            "  \"CALENDAR\" INTEGER )";

    private AppCompatActivity activity;

    DBHelper(AppCompatActivity activity) {
        this.activity = activity;
    }

    String getDbPath() {
        String result = checkExtDb();
        if (result != null) {
            FILE_HELPER.log("ext db found:" + result);
        } else {
            FILE_HELPER.log("ext db not found");
            result = findOriginDb();
            if (result != null) {
                FILE_HELPER.log("origin db found:" + result);
            }
        }
        return result;
    }

    private String checkExtDb() {
        String result = null;
        String mifit_dir_path = TrackExporter.getFullPath();
        FileHelper.checkPathExistAndCreate(mifit_dir_path);
        File mifit_dir = new File(mifit_dir_path);
        FILE_HELPER.log("search for local db in:" + mifit_dir_path);
        if (mifit_dir.exists()) {
            try {
                String[] list = mifit_dir.list();
                for (String fileName : list) {
                    File curFile = new File(mifit_dir_path, fileName);
                    if (!curFile.isDirectory() && curFile.getName().contains("origin.db")) {
                        result = curFile.getPath();
                        FILE_HELPER.log("ext db found:" + result);
                        break;
                    }
                }
            } catch (Exception ex) {
                FILE_HELPER.log("checkExtDb():" + ex.getMessage());
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
                    FILE_HELPER.log("origin db found:" + result);
                    break;
                }
            }
        }
        return result;
    }

    private String dbPathFinder() {
        SQLiteDatabase sqLiteDatabase = activity.openOrCreateDatabase("tmp.db", Context.MODE_PRIVATE, null);
        sqLiteDatabase.execSQL(TMP_DB_QUERY);
        String path = sqLiteDatabase.getPath();
        Toast.makeText(activity, path, Toast.LENGTH_SHORT).show();
        sqLiteDatabase.close();
        return path;
    }
}
