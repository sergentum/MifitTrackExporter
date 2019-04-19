package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import java.util.ArrayList;

public class RawTrackData {

    // theese fields aren't bulked
    long startTime;
    long endTime;
    int distance;
    int costTime;
    int activityType;
    public int size;

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
        stringBuilder.append(String.format("Start: %d", startTime)).append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append(String.format("Duration: %d", costTime)).append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append(String.format("End: %d", endTime)).append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append(String.format("Type: %d", activityType)).append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("\r\n");

        stringBuilder.append("Altitude").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Latitude").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Longitude").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Time").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("HeartRate").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("First").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Second").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Cadence").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("Stride").append(TrackExporter.CSV_COLUMN_DELIMITER);
        stringBuilder.append("\r\n");

        int rowCount = 0;
        rowCount = hrPoints.size() > steps.size() ? hrPoints.size() : steps.size();
        rowCount = rowCount > coordinates.size() ? rowCount : coordinates.size();
        for (int i = 0; i < rowCount; i++) {
            if (i < coordinates.size()) {
                Coordinate coordinate = coordinates.get(i);
                stringBuilder.append(coordinate.altitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(coordinate.latitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(coordinate.longitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(times.get(i)).append(TrackExporter.CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
            }

            if (i < hrPoints.size()) {
                Integer hr = hrPoints.get(i);
                stringBuilder.append(hr).append(TrackExporter.CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
            }

            if (i < steps.size()) {
                Step step = steps.get(i);
                stringBuilder.append(step.first).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(step.second).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(step.cadence).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(step.stride).append(TrackExporter.CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                stringBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
            }
            stringBuilder.append("\r\n");
        }
        return stringBuilder.toString();
    }
}
