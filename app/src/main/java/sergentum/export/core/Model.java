package sergentum.export.core;

import android.annotation.SuppressLint;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

import static sergentum.export.core.Model.ActivityType.CYCLING;
import static sergentum.export.core.Model.ActivityType.RUNNING;
import static sergentum.export.core.Model.ActivityType.OPEN_WATER;
import static sergentum.export.core.Model.ActivityType.TREADMILL;
import static sergentum.export.core.Model.ActivityType.WALKING;

public class Model {

    @SuppressLint("UseSparseArrays")
    private static HashMap<ActivityType, String> sport2desc = new HashMap<>();
    static {
        sport2desc.put(CYCLING, "Cycling");
        sport2desc.put(WALKING, "Walking");
        sport2desc.put(TREADMILL, "Treadmill");
        sport2desc.put(RUNNING, "Running");
        sport2desc.put(OPEN_WATER, "Open water");
    }

    // TODO: 2019-10-25 switch to enum instead of string
    public enum ActivityType {
        RUNNING, TREADMILL, WALKING, CYCLING, OPEN_WATER
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

    public static String formatTimestampHumanReadable(long timestamp) {
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

    public static class TrackPoint {
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
                    ", latitude=" + latitude +
                    ", longitude=" + longitude +
                    ", altitude=" + altitude +
                    ", heartRate=" + heartRate +
                    ", pace=" + pace +
                    ", cadence=" + cadence +
                    ", stride=" + stride +
                    '}';
        }

        String getLatitudeString() {
            return formatNullableNumberAsString(latitude, 8);
        }

        String getLongitudeString() {
            return formatNullableNumberAsString(longitude, 8);
        }

        String getAltitudeString() {
            return formatNullableNumberAsString(altitude, 2);
        }

        public String getHeartRateString() {
            if (heartRate == null || heartRate == 0) {
                return "";
            } else {
                return String.valueOf(heartRate);
            }
        }

        public String getCadenceString() {
            if (cadence == null || cadence == 0) {
                return "";
            } else {
                return String.valueOf(cadence);
            }
        }
    }

    private static String formatNullableNumberAsString(Long number, int decimalPlace) {
        String result = "";
        if (number != null) {
            String lonString = String.valueOf(number);
            int lonL = lonString.length();
            if (lonL > 0 && lonL > decimalPlace) {
                return lonString.substring(0, lonL - decimalPlace) + "." + lonString.substring(lonL - decimalPlace, lonL);
            } else {
                System.out.println("Number format went wrong with number: " + number + " and decimal place : " + decimalPlace);
            }
        }
        return result;
    }

    public static class TrackSummary {
        public long id;
        public ActivityType activityType;
        public long startTime;
        public long endTime;
        public int duration;
        public int distance;
        public int size;
        public int avgRr;

        public String getStartTimeAsDate() {
            return formatTimestamp(startTime);
        }

        public String getEndTimeAsDate() {
            return formatTimestamp(endTime);
        }

        public String getActivityTypeDescription() {
            return sport2desc.get(activityType);
        }

        private String getTimestamp() {
            return formatTimestampHumanReadable(id);
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
            return getTimestamp() + " "
                    + getActivityTypeDescription()  + "\n"
                    + getDuration()
                    + getDistance()
                    ;
        }

        public String toStringConsole() {
            return getTimestamp() + " "
                    + getActivityTypeDescription() + " "
                    + getDuration()
                    + getDistance()
                    ;
        }
    }

    public static class Track {
        public TrackSummary summary;
//        ArrayList<Integer> pause;
        ArrayList<TrackPoint> trackPoints = new ArrayList<>();

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
                    "id=" + summary.startTime +
                    ", duration=" + summary.duration +
                    ", size=" + summary.size +
                    ", startTime=" + summary.getStartTimeAsDate() +
                    ", endTime=" + summary.getEndTimeAsDate() +
                    ", type='" + summary.getActivityTypeDescription() + '\'' +
                    ", points: " + printTrackPoints() +
                    '}';
        }
    }

}
