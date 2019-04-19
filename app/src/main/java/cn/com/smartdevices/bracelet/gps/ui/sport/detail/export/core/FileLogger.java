package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

public class FileLogger {

    private String filePath;

    public FileLogger() {
        filePath = TrackExporter.getDebugPath() + TrackExporter.DEBUG_LOG_FILE;
        checkOrCreateFilePath(filePath);
    }

    public void log(String... args) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(new Date());
        for (String arg : args) {
            stringBuilder.append(arg).append("\r\n");
        }

        try (
                FileWriter fileWriter = new FileWriter(filePath, true);
        ) {
            fileWriter.write(stringBuilder.toString());
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    static void writeStringToFile(String output, String fileName) {
        try (
                FileWriter fileWriter = new FileWriter(fileName)
        ) {
            fileWriter.write(output);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static boolean checkOrCreateFilePath(String filepath) {
        File file = new File(filepath);
        if (!file.exists()) {

            return file.mkdirs();
        } else return false;
    }
}
