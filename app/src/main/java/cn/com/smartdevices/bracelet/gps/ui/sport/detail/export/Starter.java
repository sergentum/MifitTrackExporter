package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public abstract class Starter {

    public boolean log(String string) {
        System.out.println(string);
        return true;
    }

    public boolean log(String string, Exception e) {
        e.printStackTrace();
        return true;
    }

    public void showToast(String string, int length) {
        System.out.println("toast:" + string);
    }

    public boolean writeStringToFile(String output, String fileName) {
        checkIfPathExistAndCreate(fileName);
        boolean result;
        try (FileWriter fileWriter = new FileWriter(fileName)) {
            fileWriter.write(output);
            result = true;
        } catch (IOException ex) {
            ex.printStackTrace();
            result = false;
        }
        return result;
    }

    boolean checkIfPathExistAndCreate(String filePath) {
        File path = new File(filePath);

        if (filePath.contains(".")) {
            // that means we got file as path, but we don't want to create dir "file.ext"
            File file = new File(filePath);
            String parent = file.getParent();
            path = new File(parent);
        }

        if (path.exists()) {
            log("path exists:" + path);
            return true;
        } else {
            log( "path doesn't exists:" + path);
            if (path.mkdirs()) {
                log("path created:" + path);
                return true;
            } else {
                String msg = "path can't be created:" + path;
                log(msg);
                showToast(msg, 0);
            }
        }
        return false;
    }
}
