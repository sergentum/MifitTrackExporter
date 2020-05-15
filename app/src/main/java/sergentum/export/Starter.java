package sergentum.export;

import sergentum.export.core.Model;
import sergentum.export.core.Printer;
import sergentum.export.core.RawData;
import sergentum.export.core.RawData.QueryData;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import static sergentum.export.core.Model.formatTimestampHumanReadable;

public abstract class Starter {
    public static final String RAW_CSV = "-raw.csv";
    public static final String TCX_EXT = ".tcx";
    public static final String GPX_EXT = ".gpx";
    public static final String COMMA = ",";
    public static final String SEMICOLON = ";";
    public static final String EMPTY_VALUE = "-";
    public static final String CSV_COLUMN_DELIMITER = ";";

    public static String DEVICE_PATH = "";
    public static String FILE_FORMAT;
    // I HATE YOU DEVELOPER WHEN YOU PUT YOUR F*CKING FILES INTO THE ROOT OF MY STORAGE
    public static String EXPORT_PATH = "Android/Mifit/";
    public static final String DEBUG_OUT_PATH = "debug/";
    public static final String DEBUG_LOG_FILE = "log.txt";

    public static final String TAG = "mifit1";
    static final String EXT_DB_NAME = "origin.db";
    static Boolean debug;


    static final String TRACK_ID_QUERY = "   SELECT " +
            "       TRACKRECORD.TRACKID," +
            "       TRACKDATA.TYPE," +
            "       TRACKRECORD.DISTANCE," +
            "       TRACKRECORD.COSTTIME" +
            "       FROM TRACKDATA, TRACKRECORD" +
            "       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;";

    static final String TRACK_DATA_QUERY =
            "SELECT " +
                    "TRACKDATA.TRACKID," +
                    "TRACKDATA.SIZE," +
                    "TRACKDATA.BULKLL," +
                    "TRACKDATA.BULKGAIT," +
                    "TRACKDATA.BULKAL," +
                    "TRACKDATA.BULKTIME," +
                    "TRACKDATA.BULKHR," +
                    "TRACKDATA.BULKPACE," +
                    "TRACKDATA.BULKPAUSE," +
                    "TRACKDATA.BULKSPEED," +
                    "TRACKDATA.TYPE," +
                    "TRACKDATA.BULKFLAG," +
                    "TRACKRECORD.COSTTIME," +
                    "TRACKRECORD.ENDTIME, " +
                    "TRACKRECORD.DISTANCE " +
                    "FROM TRACKDATA, TRACKRECORD " +
                    "WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID " +
                    "AND TRACKDATA.TRACKID = ";

    public static String getFullPath() {
        return DEVICE_PATH + EXPORT_PATH;
    }

    public static String getDebugPath() {
        return DEVICE_PATH + EXPORT_PATH + DEBUG_OUT_PATH;
    }

    public abstract Map<Long, Model.TrackSummary> loadTrackSummaryFromDb();

    public abstract void showTracks();

    public abstract QueryData readRawDataWithId(long id);

    public boolean log(String... args) {
        String s = stringArrayToString(args);
        System.out.println(s);
        return true;
    }

    String stringArrayToString(String... args) {
        StringBuilder stringBuilder = new StringBuilder();
        String pattern = "yyyy-MM-dd_HH:mm:ss.SSSZ";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String date = simpleDateFormat.format(new Date());

        stringBuilder.append(date).append(" : ");
        for (String arg : args) {
            if (arg != null) {
                String replace = arg.replace("\n", " @ ");
                stringBuilder.append(replace);
            } else {
                stringBuilder.append(" null ");
            }
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
            log(ex.getMessage());
            result = false;
        }
        return result;
    }

    String exportGPX(Model.Track track) {
        String fileName = generateFileName(track);
        String gpx = Printer.printGpx(track);
        String gpxFullPath = getFullPath() + fileName + GPX_EXT;
        writeStringToFile(gpx, gpxFullPath);
        return fileName + GPX_EXT;
    }

    String exportTCX(Model.Track track) {
        String fileName = generateFileName(track);
        String tcx = Printer.printTcx(track);
        String tcxFullPath = getFullPath() + fileName + TCX_EXT;
        writeStringToFile(tcx, tcxFullPath);
        return fileName + TCX_EXT;
    }

    private static String generateFileName(Model.Track track) {
        return String.format(Locale.US, "%s_%d",
                formatTimestampHumanReadable(track.summary.startTime),
                track.summary.distance);
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

    public Boolean getDebug() {
        return debug;
    }
}
