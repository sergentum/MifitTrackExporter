package cn.com.smartdevices.bracelet.gps.ui.sport.detail.android;

import android.content.Context;
import android.content.DialogInterface;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.widget.Toast;

public class ChooseTrackClickListener implements DialogInterface.OnClickListener {
    private AppCompatActivity activity;
    private String[] values;

    public ChooseTrackClickListener(AppCompatActivity appCompatActivity, String[] values) {
        this.activity = appCompatActivity;
        this.values = values;
    }

    public void onClick(DialogInterface dialogInterface, int i) {
        Toast.makeText(activity, "got " + i + " chosen", Toast.LENGTH_SHORT).show();
    }
}
