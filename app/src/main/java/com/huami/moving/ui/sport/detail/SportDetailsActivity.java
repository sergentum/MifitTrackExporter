package com.huami.moving.ui.sport.detail;

import android.app.Activity;
import android.view.View;
import sergentum.export.MifitStarter;

public class SportDetailsActivity extends Activity {

    // this is entry point to export project from MIFIT
    // method should be copied in SportDetailsActivity.smali
    public void onShareClicked(View view) {
        initExport();
    }

    public void initExport() {
        MifitStarter starter = new MifitStarter(this);
        starter.showTracks();
    }
}
