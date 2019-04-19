package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import java.util.concurrent.TimeUnit;

public class TrackHeader {
    public long id;
    public int type;
    public int duration;
    public int distance;

    private String getActivityType() {
        return Track.getActivityTypeDescription(type) + " ";
    }

    private String getTimestamp() {
        return TrackPoint.formatTimestampHumanReadable(id) + " ";
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
}
