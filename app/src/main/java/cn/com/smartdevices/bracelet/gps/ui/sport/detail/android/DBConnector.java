package cn.com.smartdevices.bracelet.gps.ui.sport.detail.android;

import android.Manifest;
import android.content.Context;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.os.Environment;
import android.util.Log;
import android.widget.Toast;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.ExportTrack;

import java.io.File;
import java.io.FileWriter;

public class DBConnector {
    private Context context;
    public SQLiteDatabase sqLiteDB;
    public DBHelper dbHelper;

    public DBConnector(Context context, String dbName) {
        this.context = context;
        this.dbHelper = new DBHelper(context, dbName);
    }

    public String getDatabaseFullName() {
        String result = null;
        String mifit_dir_path = Environment.getExternalStorageDirectory().getPath() + "/" + ExportTrack.getFullPath();
        File mifit_dir = new File(mifit_dir_path);
        Log.d("mifit", "path:" + mifit_dir_path);
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
                        break;
                    }
                }
            } catch (Exception ex) {
                Log.d("mifit", ex.getMessage());
            }
        }
        Toast.makeText(context, "db found:" + result, Toast.LENGTH_SHORT).show();
        if (result == null) {
            return E_originDatabaseFinder();
        } else {
            return result;
        }
    }

    public String E_originDatabaseFinder() {
        String dbName = "origin_db";
        String dbJournal = "journal";
        String pathToDb = dbPathFinder();
        String result = "";
        File directory = new File(pathToDb);
        String[] list = directory.list();
        for (String file : list) {
            directory = new File(pathToDb, file);
            File curFile = directory;
            if (!curFile.isDirectory() && curFile.getName().startsWith(dbName) && !curFile.getName().contains(dbJournal)) {
                result = curFile.getPath();
                break;
            }
        }
        return result;
    }

    private String dbPathFinder() {
        FileLogger fileLogger = new FileLogger();
        String tableName = " tmpTable ";
        String createCommand = " CREATE TABLE IF NOT EXISTS ";
        String tableSchema = " (dummy1 INTEGER, dummy2 TEXT) ";

        open();
        sqLiteDB.execSQL(createCommand + tableName + tableSchema);
        File file = new File(sqLiteDB.getPath());
        String result = file.getParent();
        fileLogger.log("dbPathFinder :" + result);
        close();

        return result;
    }

    public void open() {
        try {
            sqLiteDB = dbHelper.getWritableDatabase();
        } catch (android.database.SQLException s) {
            FileLogger fileLogger = new FileLogger();
            fileLogger.log("Error with DB: " + s.getMessage());
        }
    }

    public void close() {
        sqLiteDB.close();
    }
}
