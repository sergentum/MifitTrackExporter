package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.Manifest;
import android.app.AlertDialog;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v4.content.PermissionChecker;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Toast;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.android.ChooseTrackClickListener;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.android.DBConnector;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.android.DBHelper;
import com.example.username.mifittrackexporter.MainActivity;

import java.sql.*;
import java.util.*;

import static android.content.ContentValues.TAG;
import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.WriteFile.writeStringToFile;

public class ExportTrack {
    AppCompatActivity activity;

    private SQLiteDatabase sqLiteDB;
    private DBHelper dbHelper;

    // todo add settings
    public static boolean debug = true;

    public static final String COMMA = ",";
    public static final String SEMICOLON = ";";
    public static final String EMPTY_VALUE = "-";
    public static final String CSV_COLUMN_DELIMITER = ";";

    // TODO: 2019-04-13 create full path
    public static String DEVICE_PATH = "";
    // I HATE YOU DEVELOPER WHEN YOU PUT YOUR F*CKING FILES INTO THE ROOT OF MY STORAGE
    public static String MIFIT_PATH = "Android/Mifit/";
    public static final String DEBUG_OUT_PATH = "debug/";
    public static final String DEBUG_LOG_FILE = "log.txt";
    public static final String DEBUG_EXT = "-raw.csv";
    public static final String TCX_EXT = ".tcx";

    public ExportTrack(AppCompatActivity activity) {
        this.activity = activity;
    }

    public static String getFullPath() {
        return DEVICE_PATH + MIFIT_PATH;
    }

    public static String getDebugPath() {
        return DEVICE_PATH + MIFIT_PATH + DEBUG_OUT_PATH;
    }

    public static void launchExport() {
        MLogger mLogger = new MLogger(getDebugPath() + DEBUG_LOG_FILE);
        mLogger.log("export started");

        List<RawTrackData> rawDataTracks = readRawDataFromDb();
        for (RawTrackData rawDataTrack : rawDataTracks) {
            writeStringToFile(rawDataTrack.toString(), getDebugPath() + rawDataTrack.startTime + DEBUG_EXT);

            Track track = compileDataToTrack(rawDataTrack);

            PrintTcx printTcx = new PrintTcx(track);
            writeStringToFile(printTcx.printTrack(), getFullPath() + getFileName(track) + TCX_EXT);
        }
        mLogger.log("export finished");
    }

    private static String getFileName(Track track) {
        return String.format("%s %s %d",
                TrackPoint.formatTimestampHumanReadable(track.startTime),
                track.getActivityTypeDescription(),
                track.distance);
    }

    private static Track compileDataToTrack(RawTrackData rawTrackData) {
        Track track = new Track();
        long timestamp = rawTrackData.startTime;

        track.size = (rawTrackData.size);
        track.startTime = (timestamp);
        track.endTime = (rawTrackData.endTime);
        track.duration = (rawTrackData.costTime);
        track.distance = rawTrackData.distance;
        track.activityType = (rawTrackData.activityType);

        // HR points is a base for track export
        // additional info will be added to hr points
        timestamp = rawTrackData.startTime;
        ArrayList<TrackPoint> hrTrackPoints = new ArrayList<>();
        ArrayList<Integer> hrPoints = rawTrackData.hrPoints;
        for (Integer hrPoint : hrPoints) {
            TrackPoint trackPoint = new TrackPoint();
            trackPoint.timestamp = timestamp;
            trackPoint.heartRate = hrPoint;
            hrTrackPoints.add(trackPoint);
            timestamp += 1;
        }

        timestamp = rawTrackData.startTime;
        Map<Long, TrackPoint> coordTrackPointMap = new TreeMap<>();
        for (int i = 0; i < rawTrackData.size; i++) {
            TrackPoint trackPoint = new TrackPoint();
            Integer integer = rawTrackData.times.get(i);
            if (integer == 0) {
                integer = 1;
            }
            trackPoint.altitude = rawTrackData.coordinates.get(i).altitude;
            trackPoint.latitude = rawTrackData.coordinates.get(i).latitude;
            trackPoint.longitude = rawTrackData.coordinates.get(i).longitude;
            timestamp += integer;
            trackPoint.timestamp = timestamp;
            coordTrackPointMap.put(timestamp, trackPoint);
        }


        timestamp = rawTrackData.startTime;
        Map<Long, TrackPoint> stepTrackPointsMap = new TreeMap<>();
        ArrayList<Step> steps = rawTrackData.steps;
        for (Step step : steps) {
            TrackPoint trackPoint = new TrackPoint();

            trackPoint.cadence = step.cadence;
            trackPoint.stride = step.stride;
            timestamp = timestamp + step.first;
            trackPoint.timestamp = timestamp;
            stepTrackPointsMap.put(timestamp, trackPoint);
        }

//        String debugPoints = PrintDebug.printRawPoints(rawTrackData.startTime, hrTrackPoints, coordTrackPList, stepTrackPoints);
//        WriteFile.writeStringToFile(debugPoints, getDebugPath() + rawTrackData.startTime + "-points.csv");

        track.trackPoints = joinPointArrays(hrTrackPoints, coordTrackPointMap, stepTrackPointsMap);
        return track;
    }

    private static ArrayList<TrackPoint> joinPointArrays(
            ArrayList<TrackPoint> hrPoints,
            Map<Long, TrackPoint> coordPointsMap,
            Map<Long, TrackPoint> stepPointsMap
    ) {
        System.out.println("Coord points map before join:" + coordPointsMap.size());
        ArrayList<TrackPoint> resultPoints = new ArrayList<>();
        int i = 0;
        long timestamp;
        TrackPoint lastHrPoint = null;
        for (TrackPoint hrPoint : hrPoints) {
            timestamp = hrPoint.timestamp;
            TrackPoint coordPoint = coordPointsMap.get(timestamp);
            joinPoints(hrPoint, coordPoint);
            coordPointsMap.remove(timestamp);

            if (stepPointsMap.size() > 0) {
                TrackPoint stepPoint = stepPointsMap.get(timestamp);
                joinPoints(hrPoint, stepPoint);
                stepPointsMap.remove(timestamp);
            }
            i++;
            resultPoints.add(hrPoint);
            lastHrPoint = hrPoint;
        }

        for (Map.Entry<Long, TrackPoint> coordTrackPointEntry : coordPointsMap.entrySet()) {
            timestamp = coordTrackPointEntry.getKey();
            TrackPoint coordPoint = coordTrackPointEntry.getValue();
            TrackPoint stepPoint = stepPointsMap.get(timestamp);
            joinPoints(coordPoint, stepPoint);
            joinPoints(coordPoint, lastHrPoint);
            resultPoints.add(coordPoint);
        }

        // todo compile leftover points coords and cadence
        System.out.println("Coord points map after join:" + coordPointsMap.size());
        return resultPoints;
    }

    private static void joinPoints(TrackPoint p1, TrackPoint p2) {
        if (p2 != null) {
            p1.latitude = p2.latitude != null ? p2.latitude : p1.latitude;
            p1.longitude = p2.longitude != null ? p2.longitude : p1.longitude;
            p1.altitude = p2.altitude != null ? p2.altitude : p1.altitude;
            p1.pace = p2.pace != null ? p2.pace : p1.pace;
            p1.cadence = p2.cadence != null ? p2.cadence : p1.cadence;
            p1.stride = p2.stride != null ? p2.stride : p1.stride;
        }
    }


    private static List<RawTrackData> readRawDataFromDb() {
        ArrayList<RawTrackData> rawTrackDataList = new ArrayList<>();
        Connection conn = null;
        try {
            // db parameters
//            String url = "jdbc:sqlite:origin_db_pause.db";
            String url = "jdbc:sqlite:origin.db";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            System.out.println("Connection to SQLite has been established.");

            Statement statement = conn.createStatement();

            String args = "SELECT " +
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
                    "WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID "
//                            "AND TRACKDATA.TRACKID = 1554686813"
                    ;

            ResultSet rs = statement.executeQuery(args);
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
                RawTrackData rawData = TrackDataParser.parseRawData(rs, rsmd);
                rawTrackDataList.add(rawData);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return rawTrackDataList;
    }

    public void K_showTracks() {
        ArrayList<RawTrackData> rawTrackDataList = new ArrayList<>();
        Connection conn = null;

//            String url = "jdbc:sqlite:origin.db";
        DBConnector dbConnector = new DBConnector(activity, "tmp.db");
        String databaseFullName = dbConnector.getDatabaseFullName();
        Log.d("mifit", databaseFullName);
        dbConnector = new DBConnector(activity, databaseFullName);

        dbConnector.open();
        Cursor cursor = dbConnector.sqLiteDB.rawQuery("" +
                "   SELECT datetime(TRACKDATA.TRACKID, 'unixepoch', 'localtime'),\n" +
                "       TRACKDATA.TYPE,\n" +
                "       TRACKRECORD.DISTANCE,\n" +
                "       TRACKRECORD.COSTTIME\n" +
                "       FROM TRACKDATA, TRACKRECORD\n" +
                "       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;", null);

        ArrayList<String> arrayList = new ArrayList<>();
        while (!cursor.isAfterLast()) {
            int columnCount = cursor.getColumnCount();
            String trackDesc = "";
            for (int i = 0; i < columnCount; i++) {
                trackDesc = trackDesc + cursor.getString(i) + " ";
            }
            arrayList.add(trackDesc);
        }
        cursor.close();
        dbConnector.close();

        for (String s : arrayList) {
            Log.d("mifit", s);
        }


        ChooseTrackClickListener trackChooseListener = new ChooseTrackClickListener(activity, new String[]{"1a", "2a"});

        AlertDialog.Builder alert = new AlertDialog.Builder(activity);
        alert.setTitle("title");
        alert.setItems(arrayList.toArray(new String[arrayList.size()]), trackChooseListener);
        alert.create().show();
    }
}
