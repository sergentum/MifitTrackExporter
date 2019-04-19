package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

class Step {

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
