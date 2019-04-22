package cn.com.smartdevices.bracelet.gps.ui.sport.detail;

import android.Manifest;
import android.annotation.TargetApi;
import android.app.Activity;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.*;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.TrackExportStarter;
import com.example.username.mifittrackexporter.R;

public class ExportActivity extends AppCompatActivity implements View.OnClickListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.track_export);
        Button btnActTwo = (Button) findViewById(R.id.export_btn);
        btnActTwo.setOnClickListener(this);

        Switch switch1 = (Switch) findViewById(R.id.switch_1);

        // Set a checked change listener for toggle button
        switch1.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if(isChecked){

                    // Make a toast to display toggle button status
                    Toast.makeText(getApplicationContext(),
                            "Toggle is on", Toast.LENGTH_SHORT).show();
                }
                else{

                    // Make a toast to display toggle button status
                    Toast.makeText(getApplicationContext(),
                            "Toggle is off", Toast.LENGTH_SHORT).show();
                }
            }
        });

        //To save settings
        SharedPreferences settings = getSharedPreferences("FileName", Activity.MODE_PRIVATE);
        SharedPreferences.Editor editor = settings.edit();
        editor.putString("username","hello");
        editor.putString("password", "123456");
        editor.commit();

//To get Settings
        settings.getString("username","");
        settings.getString("password","");

//        Toast.makeText(this, "Permission (already) Granted!", Toast.LENGTH_SHORT).show();
        // Here, thisActivity is the current activity
        if (ContextCompat.checkSelfPermission(this,
                Manifest.permission.READ_CONTACTS)
                != PackageManager.PERMISSION_GRANTED) {

            // Permission is not granted
            // Should we show an explanation?
            if (ActivityCompat.shouldShowRequestPermissionRationale(this,
                    Manifest.permission.READ_CONTACTS)) {
                // Show an explanation to the user *asynchronously* -- don't block
                // this thread waiting for the user's response! After the user
                // sees the explanation, try again to request the permission.
            } else {
                // No explanation needed; request the permission
                ActivityCompat.requestPermissions(this,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 220);

                // MY_PERMISSIONS_REQUEST_READ_CONTACTS is an
                // app-defined int constant. The callback method gets the
                // result of the request.
            }
        } else {
            // Permission has already been granted
        }
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.export_btn:
                if (checkStoragePermission()) {
                    TrackExportStarter trackExportStarter = new TrackExportStarter(this);
                    trackExportStarter.showTracks();
                } else {
                    Toast.makeText(getApplicationContext(),
                            "don't have write storage permission", Toast.LENGTH_SHORT).show();
                }
                break;
        }
    }

    @TargetApi(Build.VERSION_CODES.M)
    private boolean checkStoragePermission() {
        int permissionCheckRead = ContextCompat.checkSelfPermission(this,
                Manifest.permission.WRITE_EXTERNAL_STORAGE);
        if (permissionCheckRead != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(this,
                    Manifest.permission.WRITE_EXTERNAL_STORAGE)) {
                ActivityCompat.requestPermissions(this,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE}, 220);
            } else {
                ActivityCompat.requestPermissions(this,
                        new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE},
                        220);
            }
            return false;
        } else
            return true;
    }
}
