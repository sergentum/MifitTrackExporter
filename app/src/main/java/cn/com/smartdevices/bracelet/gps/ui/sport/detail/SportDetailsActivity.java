package cn.com.smartdevices.bracelet.gps.ui.sport.detail;

import android.app.Activity;
import android.view.View;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.Starter;

public class SportDetailsActivity extends Activity {

    // this is entry point to export project
    public void onShareClicked(View view) {
        Starter starter = new Starter(this);
        starter.showTracks();
    }
}
