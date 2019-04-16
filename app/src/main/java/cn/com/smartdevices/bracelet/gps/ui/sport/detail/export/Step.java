package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

public class Step {

    int first;
    int second;
    int stride;
    int cadence;

    public Step(int first, int second, int stride, int cadence) {
        this.first = first;
        this.second = second;
        this.stride = stride;
        this.cadence = cadence;
    }
}
