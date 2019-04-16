package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

public class Step {

    public int first;
    public int second;
    public int stride;
    public int cadence;

    public Step(int first, int second, int stride, int cadence) {
        this.first = first;
        this.second = second;
        this.stride = stride;
        this.cadence = cadence;
    }
}
