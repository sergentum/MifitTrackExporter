package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import java.util.ArrayList;
import java.util.HashMap;

public class Track {
    long startTime;
    long duration;
    long endTime;
    int distance;
    int activityType;
    int size;

    ArrayList<Integer> pause;
    ArrayList<TrackPoint> trackPoints = new ArrayList<>();

    private static HashMap<Integer, String> activityTypeMapping = new HashMap<>();

    static {
        String defaultActivity = "Running";
        activityTypeMapping.put(0, defaultActivity);
        activityTypeMapping.put(1, "Outdoor running");
        activityTypeMapping.put(2, defaultActivity);
        activityTypeMapping.put(3, defaultActivity);
        activityTypeMapping.put(4, defaultActivity);
        activityTypeMapping.put(5, defaultActivity);
        activityTypeMapping.put(6, "Walking");
        activityTypeMapping.put(7, defaultActivity);
        activityTypeMapping.put(8, "Treadmill");
        activityTypeMapping.put(9, "Outdoor Cycling");
    }

    String getStartTimeAsDate() {
        return TrackPoint.formatTimestamp(startTime);
    }

    private String getEndTimeAsDate() {
        return TrackPoint.formatTimestamp(endTime);
    }

    String getActivityTypeDescription() {
        return getActivityTypeDescription(activityType);
    }

    static String getActivityTypeDescription(int i) {
        return activityTypeMapping.get(i);
    }

    private String printTrackPoints() {
        StringBuilder stringBuffer = new StringBuilder();
        stringBuffer.append("size:").append(trackPoints.size());
        if (trackPoints.size() > 0) {
            stringBuffer.append("\r\n");
            for (TrackPoint trackPoint : trackPoints) {
                stringBuffer.append(trackPoint).append("\r\n");
            }
            stringBuffer.append("\r\n");
        }
        return stringBuffer.toString();
    }

    @Override
    public String toString() {
        return "Track{" +
                "id=" + startTime +
                ", duration=" + duration +
                ", size=" + size +
                ", startTime=" + getStartTimeAsDate() +
                ", endTime=" + getEndTimeAsDate() +
                ", type='" + getActivityTypeDescription() + '\'' +
                ", points: " + printTrackPoints() +
                '}';
    }
}
