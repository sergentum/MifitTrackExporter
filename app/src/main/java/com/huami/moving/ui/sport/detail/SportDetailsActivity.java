package com.huami.moving.ui.sport.detail;

import android.app.Activity;
import android.util.Log;
import android.view.View;
import sergentum.export.MifitStarter;

import static sergentum.export.Starter.TAG;

public class SportDetailsActivity extends Activity {

    // this is entry point to export project from MIFIT
    // method should be copied in SportDetailsActivity.smali
    public void onShareClicked(View view) {
        initExport();
    }

    public void initExport() {
        MifitStarter starter = new MifitStarter(this, true);
        starter.showTracks();
    }

    // copy this method to Lcom/xiaomi/hm/health/activity/StartUpActivity;
    @Override
    protected void onResume() {
        super.onResume();
        Log.d(TAG,"com/xiaomi/hm/health/activity/StartUpActivity onResume");
        MifitStarter starter = new MifitStarter(this, false);
        starter.invokeSync();
    }
}
