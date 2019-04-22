package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.app.Activity;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackExporter;
import java.io.File;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.FILE_HELPER;

class DBHelper {
    private static final String TMP_DB_QUERY = "" +
            "CREATE TABLE IF NOT EXISTS dummy " +
            "(\"_id\"  INTEGER primary key autoincrement, \n" +
            "  \"CALENDAR\" INTEGER )";

    private Activity activity;

    DBHelper(Activity activity) {
        this.activity = activity;
    }

    String getDbPath() {
        String result = checkExtDb();
        if (result == null) {
            result = findOriginDb();
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
                        return result;
                    }
                }
            } catch (Exception ex) {
                FILE_HELPER.log("checkExtDb():" + ex.getMessage());
            }
        }
        FILE_HELPER.log("ext db not found");
        return null;
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
                    return result;
                }
            }
        }
        FILE_HELPER.log("origin db not found");
        return null;
    }

    private String dbPathFinder() {
        SQLiteDatabase sqLiteDatabase = activity.openOrCreateDatabase("tmp.db", Context.MODE_PRIVATE, null);
        sqLiteDatabase.execSQL(TMP_DB_QUERY);
        String tmpDbPath = sqLiteDatabase.getPath();
        sqLiteDatabase.close();
        File tmpDb = new File(tmpDbPath);
        FILE_HELPER.log("origin db path:" + tmpDb.getParent());
        return tmpDb.getParent();
    }
}
