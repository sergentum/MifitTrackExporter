package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import java.io.FileWriter;
import java.io.IOException;

public class WriteFile {
    static void writeStringToFile(String output, String fileName) {
        try (
                FileWriter fileWriter = new FileWriter(fileName)
        ) {
            fileWriter.write(output);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
