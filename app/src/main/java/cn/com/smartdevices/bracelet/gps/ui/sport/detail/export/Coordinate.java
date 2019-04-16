package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

public class Coordinate {
    long latitude;
    long longitude;
    long altitude;

    public Coordinate(long latitude, long longitude, long altitude) {
        this.latitude = latitude;
        this.longitude = longitude;
        this.altitude = altitude;
    }

    public Coordinate() {
    }
}
