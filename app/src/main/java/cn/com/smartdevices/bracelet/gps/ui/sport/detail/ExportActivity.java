package cn.com.smartdevices.bracelet.gps.ui.sport.detail;

import android.Manifest;
import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.database.sqlite.SQLiteDatabase;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.StrictMode;
import android.support.v4.app.ActivityCompat;

import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.*;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.Starter;
import com.example.username.mifittrackexporter.EndomondoSynchronizer;
import com.example.username.mifittrackexporter.R;
import com.example.username.mifittrackexporter.Synchronizer;
import java.io.File;
import java.util.Locale;

// The activity allow to test export feature with empty android project
// It shouldn't be copied in mifit project
public class ExportActivity extends AppCompatActivity implements View.OnClickListener {
    TestFragment fragment;
    FragmentTransaction fTrans;

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

        fragment = new TestFragment();
        fTrans = getFragmentManager().beginTransaction();
//                    fTrans.show(fragment);
        fTrans.replace(R.id.frgmCont, fragment);
        fTrans.commit();
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.export_btn:
                if (checkStoragePermission()) {
//                    Starter starter = new Starter(this);
//                    starter.showTracks();
                    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                    StrictMode.setThreadPolicy(policy);
                    EndomondoSynchronizer endomondoSynchronizer = new EndomondoSynchronizer();
//                    Synchronizer.Status connect = endomondoSynchronizer.connect();
                    String path = Environment.getExternalStorageDirectory().getPath();
                    SQLiteDatabase sqLiteDatabase = SQLiteDatabase.openOrCreateDatabase(path + "/Android/end/runnerup.db", null);
//                    endomondoSynchronizer.upload(sqLiteDatabase, 3);
                    sqLiteDatabase.close();

                    fragment.changeColor();
//                    ExportView exportView = new ExportView(this);
//                    setContentView(exportView, exportView.getLayoutParams());


//                    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(
//                            LinearLayout.LayoutParams.FILL_PARENT,
//                            LinearLayout.LayoutParams.FILL_PARENT);
//                    LinearLayout linearLayout = new LinearLayout (this);
//
//                    Button btn1 = new Button(this);
//                    btn1.setText("Button_text");
//                    linearLayout.addView(btn1);
//                    btn1.setOnClickListener(new View.OnClickListener()
//                    {
//                        @Override
//                        public void onClick(View v) {
//                            // put code on click operation
//                            Toast onClick = Toast.makeText(ExportActivity.this, "onClick", Toast.LENGTH_SHORT);
//                            onClick.show();
//                        }
//                    });
//
//                    setContentView(linearLayout, layoutParams);

//                    FragmentManager fragmentManager = getFragmentManager();
//                    FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();


                } else {
                    Toast.makeText(getApplicationContext(),
                            "don't have write storage permission", Toast.LENGTH_SHORT).show();
                }
                break;
        }
    }

    @TargetApi(Build.VERSION_CODES.M)
    private boolean checkStoragePermission() {
        // TODO: 2019-04-22 check if it works actually
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
