package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

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
        // TODO: 2019-04-16 format duration
        return duration / 60 + " min ";
    }

    private String getDistance() {
        // TODO: 2019-04-16 format distance
        return distance / 1000 + " m ";
    }

    @Override
    public String toString() {
        return getTimestamp()
                + getActivityType()
                + getDuration()
                + getDistance()
                ;
    }
}
