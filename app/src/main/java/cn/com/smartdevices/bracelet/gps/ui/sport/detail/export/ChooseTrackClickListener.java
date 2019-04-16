package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Toast;
import java.util.ArrayList;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter.TAG;

public class ChooseTrackClickListener implements DialogInterface.OnClickListener {
    private AppCompatActivity activity;
    private ArrayList<Long> trackIds;

    public ChooseTrackClickListener(AppCompatActivity appCompatActivity, ArrayList<Long> trackIds) {
        this.activity = appCompatActivity;
        this.trackIds = trackIds;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        Log.d(TAG, "got " + i + " chosen");
        Log.d(TAG, "found " + trackIds.get(i) + " id");
        // TODO: 2019-04-16 call export starter to read db and to call trackexporter
    }
}
