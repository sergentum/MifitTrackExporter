package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

public class Model {

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

    private static String getActivityTypeDescription(int i) {
        return activityTypeMapping.get(i);
    }

    /**
     * @return formatted timestamp https://en.wikipedia.org/wiki/ISO_8601
     */
    static String formatTimestamp(long timestamp) {
        Date date = new Date(timestamp * 1000);
        SimpleDateFormat yyyyMMddTHHmmssSDF = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
        yyyyMMddTHHmmssSDF.setTimeZone(TimeZone.getTimeZone("UTC"));
        return yyyyMMddTHHmmssSDF.format(date);
    }

    static String formatTimestampHumanReadable(long timestamp) {
        Date date = new Date(timestamp * 1000);
        SimpleDateFormat yyyyMMddTHHmmssSDF = new SimpleDateFormat("yyyy-MM-dd_HH-mm");
        yyyyMMddTHHmmssSDF.setTimeZone(TimeZone.getTimeZone("UTC"));
        return yyyyMMddTHHmmssSDF.format(date);
    }


    static class Coordinate {
        long latitude;
        long longitude;
        long altitude;

        Coordinate(long latitude, long longitude, long altitude) {
            this.latitude = latitude;
            this.longitude = longitude;
            this.altitude = altitude;
        }
    }

    static class Step {

        int first;
        int second;
        int stride;
        int cadence;

        Step(int first, int second, int stride, int cadence) {
            this.first = first;
            this.second = second;
            this.stride = stride;
            this.cadence = cadence;
        }
    }

    public static class TrackHeader {
        public long id;
        public int type;
        public int duration;
        public int distance;

        private String getActivityType() {
            return getActivityTypeDescription(type) + " ";
        }

        private String getTimestamp() {
            return formatTimestampHumanReadable(id) + " ";
        }

        private String getDuration() {
            long hrs = TimeUnit.SECONDS.toHours(duration);
            long min = TimeUnit.SECONDS.toMinutes(duration) - TimeUnit.HOURS.toMinutes(hrs);
            long sec = duration - TimeUnit.MINUTES.toSeconds(TimeUnit.SECONDS.toMinutes(duration));
            return String.format("%02d:%02d:%02d", hrs, min, sec);
        }

        private String getDistance() {
            int km = distance / 1000;
            int m = distance - (km * 1000);
            return String.format("%10d.%03d km", km, m);
        }

        @Override
        public String toString() {
            return getTimestamp()
                    + getActivityType()  + "\n"
                    + getDuration()
                    + getDistance()
                    ;
        }

        public String toStringConsole() {
            return getTimestamp()
                    + getActivityType()
                    + getDuration()
                    + getDistance()
                    ;
        }
    }

    static class TrackPoint {
        Long timestamp;
        Long latitude;
        Long longitude;
        Long altitude;
        Integer heartRate;
        Integer pace;
        Integer cadence;
        Integer stride;

        @Override
        public String toString() {
            return "TrackPoint{" +
                    "timestamp=" + timestamp +
                    ", dateTime=" + formatTimestamp(timestamp) +
                    ", heartRate=" + heartRate +
                    ", latitude=" + latitude +
                    ", longitude=" + longitude +
                    ", altitude=" + altitude +
                    ", pace=" + pace +
                    ", cadence=" + cadence +
                    '}';
        }


        String getLatitudeString() {
            String latString = latitude.toString();
            int latL = latString.length();
            if (latL > 0) {
                return latString.substring(0, latL - 8) + "." + latString.substring(latL - 8, latL);
            } else {
                return "";
            }
        }

        String getLongitudeString() {
            String lonString = longitude.toString();
            int lonL = lonString.length();
            if (lonL > 0) {
                return lonString.substring(0, lonL - 8) + "." + lonString.substring(lonL - 8, lonL);
            } else {
                return "";
            }
        }

        String getAltitudeString() {
            String altString = altitude.toString();
            int altL = altString.length();
            if (altL > 2) {
                return altString.substring(0, altL - 2) + "." + altString.substring(altL - 2, altL);
            } else {
                return "0.00";
            }
        }
    }

    public static class Track {

        long startTime;
        long duration;
        long endTime;
        int distance;
        int activityType;
        int size;

//        ArrayList<Integer> pause;
        ArrayList<TrackPoint> trackPoints = new ArrayList<>();

        String getStartTimeAsDate() {
            return formatTimestamp(startTime);
        }

        private String getEndTimeAsDate() {
            return formatTimestamp(endTime);
        }

        String getActivityTypeDescription() {
            return Model.getActivityTypeDescription(activityType);
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

}
