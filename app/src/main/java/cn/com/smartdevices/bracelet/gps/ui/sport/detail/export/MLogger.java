package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.FileLogger.checkOrCreateFilePath;

public class MLogger {
    private String filePath;

    MLogger(String filePath) {
        this.filePath = filePath;
        if (checkOrCreateFilePath(filePath)) {
            System.out.println("File path exist or created");
        } else {
            System.out.println("Can't find or create File path");
        }
    }

    void log(String... args) {
        StringBuilder stringBuilder = new StringBuilder();
        SimpleDateFormat yyyyMMddTHHmmssSDF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
        yyyyMMddTHHmmssSDF.setTimeZone(TimeZone.getTimeZone("UTC"));
        String timestamp = yyyyMMddTHHmmssSDF.format(new Date());

        stringBuilder.append(timestamp);
        for (String arg : args) {
            stringBuilder.append(arg).append("\r\n");
        }

        try (
                FileWriter fileWriter = new FileWriter(filePath, true);
                PrintWriter printWriter = new PrintWriter(fileWriter)
        ) {
//            Log.d("mifit", "filepath: " + filePath);
            printWriter.println(stringBuilder.toString());
        } catch (Exception e) {
//            Log.d("mifit", "Exception while writing: " + e.getMessage());
        }
    }
}
