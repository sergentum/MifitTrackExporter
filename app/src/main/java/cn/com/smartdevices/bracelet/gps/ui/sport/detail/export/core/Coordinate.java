package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

public class Coordinate {
    public long latitude;
    public long longitude;
    public long altitude;

    public Coordinate(long latitude, long longitude, long altitude) {
        this.latitude = latitude;
        this.longitude = longitude;
        this.altitude = altitude;
    }

    public Coordinate() {
    }
}
