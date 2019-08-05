package cn.com.smartdevices.bracelet.gps.ui.sport.detail;

import android.app.Activity;
import android.view.View;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.MifitStarter;

public class SportDetailsActivity extends Activity {

    // this is entry point to export project from MIFIT
    // method should be copied in SportDetailsActivity.smali
    public void onShareClicked(View view) {
        MifitStarter starter = new MifitStarter(this);
        starter.showTracks();
    }
}
