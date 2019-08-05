package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.Model;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.RawData;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.Map;

public abstract class Starter {
    public static final String TAG = "mifit";
    static final String EXT_DB_NAME = "origin.db";

    abstract Map<Long, Model.TrackHeader> loadTrackHeadersFromDb();

    public boolean log(String... args) {
        String s = stringArrayToString(args);
        System.out.println(s);
        return true;
    }

    String stringArrayToString(String... args) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(new Date()).append("\r\n");
        for (String arg : args) {
            stringBuilder.append(arg).append("\r\n");
        }
        return stringBuilder.toString();
    }

    public boolean log(String string, Exception e) {
        System.out.println(string);
        e.printStackTrace();
        return true;
    }

    // that's just mock to keep the code compatible with android and console
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

    static void mapRawDataToQueryData(RawData.QueryData queryData, String columnName, String columnValue) {
        if (columnValue != null) {
            if (columnName.equalsIgnoreCase("TRACKID")) {
                queryData.startTime = columnValue;
            } else if (columnName.equalsIgnoreCase("ENDTIME")) {
                queryData.endTime = columnValue;
            } else if (columnName.equalsIgnoreCase("COSTTIME")) {
                queryData.costTime = columnValue;
            } else if (columnName.equalsIgnoreCase("SIZE")) {
                queryData.size = columnValue;
            } else if (columnName.equalsIgnoreCase("TYPE")) {
                queryData.activityType = columnValue;
            } else if (columnName.equalsIgnoreCase("DISTANCE")) {
                queryData.distance = columnValue;
            } else if (columnName.equalsIgnoreCase("BULKLL")) {
                queryData.BULKLL = columnValue;
            } else if (columnName.equalsIgnoreCase("BULKGAIT")) {
                queryData.BULKGAIT = columnValue;
            } else if (columnName.equalsIgnoreCase("BULKAL")) {
                queryData.BULKAL = columnValue;
            } else if (columnName.equalsIgnoreCase("BULKTIME")) {
                queryData.BULKTIME = columnValue;
            } else if (columnName.equalsIgnoreCase("BULKHR")) {
                queryData.BULKHR = columnValue.replace(";,", ";1,");
            } else if (columnName.equalsIgnoreCase("BULKPACE")) {
                queryData.BULKPACE = columnValue;
            } else if (columnName.equalsIgnoreCase("BULKFLAG")) {
                queryData.BULKFLAG = columnValue;
            }
        }
    }
}
