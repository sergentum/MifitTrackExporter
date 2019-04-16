package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class TrackPoint {
    public Long timestamp;
    public Long latitude;
    public Long longitude;
    public Long altitude;
    public Integer heartRate;
    public Integer pace;
    public Integer cadence;
    public Integer stride;

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


    /**
     * @return formatted timestamp https://en.wikipedia.org/wiki/ISO_8601
     */
    public static String formatTimestamp(long timestamp) {
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

    public String getLatitudeString() {
        String latString = latitude.toString();
        int latL = latString.length();
        if (latL > 0) {
            return latString.substring(0, latL - 8) + "." + latString.substring(latL - 8, latL);
        } else {
            return "";
        }
    }

    public String getLongitudeString() {
        String lonString = longitude.toString();
        int lonL = lonString.length();
        if (lonL > 0) {
            return lonString.substring(0, lonL - 8) + "." + lonString.substring(lonL - 8, lonL);
        } else {
            return "";
        }
    }

    public String getAltitudeString() {
        String altString = altitude.toString();
        int altL = altString.length();
        if (altL > 2) {
            return altString.substring(0, altL - 2) + "." + altString.substring(altL - 2, altL);
        } else {
            return "0.00";
        }
    }
}
