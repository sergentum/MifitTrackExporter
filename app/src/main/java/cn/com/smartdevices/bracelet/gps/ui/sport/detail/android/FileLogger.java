package cn.com.smartdevices.bracelet.gps.ui.sport.detail.android;

import android.util.Log;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.ExportTrack;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.Date;

public class FileLogger {

    private String filePath;

    public FileLogger() {
        filePath = ExportTrack.getDebugPath();
        File file = new File(filePath);
        boolean mkdirs = file.getParentFile().mkdirs();
        Log.w("mifit", "fileLogger created: " + mkdirs);
    }

    public void log(String... args) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(new Date());
        for (String arg : args) {
            stringBuilder.append(arg).append("\r\n");
        }

        try (
                FileWriter fileWriter = new FileWriter(filePath, true);
                PrintWriter printWriter = new PrintWriter(fileWriter)
        ) {
            Log.d("mifit", "filepath: " + filePath);
            printWriter.println(stringBuilder.toString());  //New line
        } catch (Exception e) {
            Log.d("mifit", "Exception while writing: " + e.getMessage());
        }
    }
}
