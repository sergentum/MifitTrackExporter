package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import java.util.ArrayList;

public class RawTrackData {
//
//            1 TRACKID -1554201133-
//            2 SIZE -49-
//            3 BULKLL 49
//            4 BULKGAIT 108
//            5 BULKAL 49
//            6 BULKTIME 49
//            7 BULKHR 93
//            8 BULKPACE 49
//            9 BULKPAUSE 1--
//            10 TYPE -1-
//            11 BULKFLAG 49
//            12 COSTTIME -216-
//            13 ENDTIME -1554201349-
//
    // theese fields aren't bulked
    long startTime;
    long endTime;
    int distance;
    int costTime;
    int activityType;
    int size;

    // theese data is synced between each other, so it's size should be equal
    ArrayList<Integer> times = new ArrayList<>();
    ArrayList<Coordinate> coordinates = new ArrayList<>();
    ArrayList<Integer> flags = new ArrayList<>();
    ArrayList<Integer> paces = new ArrayList<>();
    ArrayList<Integer> speeds = new ArrayList<>();

    ArrayList<Integer> hrPoints = new ArrayList<>();

    ArrayList<Step> steps = new ArrayList<>();

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(String.format("Start: %d", startTime)).append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append(String.format("Duration: %d", costTime)).append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append(String.format("End: %d", endTime)).append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append(String.format("Type: %d", activityType)).append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("\r\n");

        stringBuilder.append("Altitude").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Latitude").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Longitude").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Time").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("HeartRate").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("First").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Second").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Cadence").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Stride").append(ExportTrack.CSV_COLUMN_DELIMITER);
        stringBuilder.append("\r\n");

        int rowCount = 0;
        rowCount = hrPoints.size() > steps.size() ? hrPoints.size() : steps.size();
        rowCount = rowCount > coordinates.size() ? rowCount : coordinates.size();
        for (int i = 0; i < rowCount; i++) {
            if (i < coordinates.size()) {
                Coordinate coordinate = coordinates.get(i);
                stringBuilder.append(coordinate.altitude).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(coordinate.latitude).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(coordinate.longitude).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(times.get(i)).append(ExportTrack.CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
            }

            if (i < hrPoints.size()) {
                Integer hr = hrPoints.get(i);
                stringBuilder.append(hr).append(ExportTrack.CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
            }

            if (i < steps.size()) {
                Step step = steps.get(i);
                stringBuilder.append(step.first).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(step.second).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(step.cadence).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(step.stride).append(ExportTrack.CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                stringBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
            }
            stringBuilder.append("\r\n");
        }
        return stringBuilder.toString();
    }
}
