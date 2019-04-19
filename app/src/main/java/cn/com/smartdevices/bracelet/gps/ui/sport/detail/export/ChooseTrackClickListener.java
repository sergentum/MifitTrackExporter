package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.content.DialogInterface;
import android.util.Log;
import java.util.ArrayList;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.FILE_HELPER;
import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.TAG;

public class ChooseTrackClickListener implements DialogInterface.OnClickListener {
    private TrackExportStarter starter;
    private ArrayList<Long> trackIds;

    ChooseTrackClickListener(TrackExportStarter starter, ArrayList<Long> trackIds) {
        this.starter = starter;
        this.trackIds = trackIds;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        TrackExportStarter.FILE_HELPER.log("got " + i + " chosen");
        TrackExportStarter.FILE_HELPER.log("found " + trackIds.get(i) + " id");
        starter.readRawDataWithId(trackIds.get(i));
        FILE_HELPER.close();
    }
}
