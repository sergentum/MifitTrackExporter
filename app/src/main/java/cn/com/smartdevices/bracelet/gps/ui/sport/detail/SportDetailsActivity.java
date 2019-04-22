package cn.com.smartdevices.bracelet.gps.ui.sport.detail;

import android.app.Activity;
import android.view.View;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter;

public class SportDetailsActivity extends Activity {

    public void onShareClicked(View view) {
        TrackExportStarter trackExportStarter = new TrackExportStarter(this);
        trackExportStarter.showTracks();
    }
}
