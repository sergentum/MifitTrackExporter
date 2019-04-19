package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.Manifest;
import android.annotation.TargetApi;
import android.content.pm.PackageManager;
import android.os.Build;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackExporter;
import java.io.Closeable;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.TAG;

public class FileHelper implements Closeable {

    FileWriter logWriter;
    private AppCompatActivity activity;

    FileHelper(AppCompatActivity activity) {
        this.activity = activity;
        String filePath = TrackExporter.getDebugPath();
        if (checkStoragePermission()) {
            Log.d(TAG, "write storage permission granted");
            if (checkPathExistAndCreate(filePath)) {
                String logFilePath = filePath + TrackExporter.DEBUG_LOG_FILE;
                try {
                    logWriter = new FileWriter(logFilePath);
                    Log.d(TAG, "fileLogger created:" + logWriter);
                } catch (IOException e) {
                    Log.e(TAG, e.getMessage() + logWriter);
                }
            }
        } else {
            Log.d(TAG, "write storage permission denied");
        }
    }

    @TargetApi(Build.VERSION_CODES.M)
    private boolean checkStoragePermission() {
        int permissionCheckRead = ContextCompat.checkSelfPermission(activity,
                Manifest.permission.WRITE_EXTERNAL_STORAGE);
        if (permissionCheckRead != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(activity,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE)) {
                ActivityCompat.requestPermissions(activity,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 220);
            } else {
                ActivityCompat.requestPermissions(activity,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                        220);
            }
            return false;
        } else
            return true;
    }

    public void log(String... args) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(new Date()).append("\r\n");
        for (String arg : args) {
            stringBuilder.append(arg).append("\r\n");
        }
        try {
            Log.d(TAG, stringBuilder.toString());
            logWriter.write(stringBuilder.toString());
            logWriter.flush();
        } catch (Exception e) {
            Log.e(TAG, "ex while logging:" + e.getMessage());
        }
    }

    public static void writeStringToFile(String output, String fileName) {
        try (
                FileWriter fileWriter = new FileWriter(fileName)
        ) {
            fileWriter.write(output);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    static boolean checkPathExistAndCreate(String filePath){
        File file = new File(filePath);
        if (file.exists()) {
            Log.d(TAG, "file exists:" + filePath);
            return true;
        } else {
            Log.d(TAG, "file doesn't exists:" + filePath);
            if (file.mkdirs()) {
                Log.d(TAG, "filepath created:" + filePath);
                return true;
            } else {
                Log.e(TAG, "filepath can't be created:" + filePath);
            }
        }
        return false;
    }

    @Override
    public void close() {
        try {
            logWriter.close();
        } catch (IOException e) {
            Log.e(TAG, "ex while closing file:" + e.getMessage());
        }
    }
}
