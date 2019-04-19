package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.FileHelper;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.FileHelper.writeStringToFile;


public class TrackExporter {

    // todo add settings
    public static boolean debug = true;

    static final String COMMA = ",";
    static final String SEMICOLON = ";";
    static final String EMPTY_VALUE = "-";
    static final String CSV_COLUMN_DELIMITER = ";";

    // TODO: 2019-04-13 create full path
    public static String DEVICE_PATH = "";
    // I HATE YOU DEVELOPER WHEN YOU PUT YOUR F*CKING FILES INTO THE ROOT OF MY STORAGE
    private static String MIFIT_PATH = "Android/Mifit/";
    private static final String DEBUG_OUT_PATH = "debug/";
    public static final String DEBUG_LOG_FILE = "log.txt";
    private static final String RAW_CSV = "-raw.csv";
    private static final String TCX_EXT = ".tcx";

    static FileHelper fileHelper;

    public TrackExporter(FileHelper fileHelper) {
        fileHelper = fileHelper;
    }

    public static String getFullPath() {
        return DEVICE_PATH + MIFIT_PATH;
    }

    public static String getDebugPath() {
        return DEVICE_PATH + MIFIT_PATH + DEBUG_OUT_PATH;
    }

    public void launchExport(ArrayList<RawQueryData> rawTrackDataList) {
        for (RawQueryData rawQueryData : rawTrackDataList) {
            RawTrackData rawTrackData = RawDataParser.parseRawData(rawQueryData);
            writeStringToFile(rawTrackData.toString(), getDebugPath() + rawTrackData.startTime + RAW_CSV);

            Track track = compileDataToTrack(rawTrackData);
            PrintTcx printTcx = new PrintTcx(track);
            writeStringToFile(printTcx.print(), getFullPath() + getFileName(track) + TCX_EXT);
        }
    }

    private static String getFileName(Track track) {
        return String.format("%s_%d",
                TrackPoint.formatTimestampHumanReadable(track.startTime),
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

        String debugPoints = PrintDebug.printRawPoints(hrTrackPoints, coordTrackPointMap, stepTrackPointsMap);
        writeStringToFile(debugPoints, getDebugPath() + rawTrackData.startTime + "-points.csv");

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
//                RawTrackData rawData = TrackDataParser.parseRawData(rs, rsmd);
//                rawTrackDataList.add(rawData);
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


}
