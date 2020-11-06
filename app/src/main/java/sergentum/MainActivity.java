package sergentum;

import android.Manifest;
import android.annotation.TargetApi;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.StrictMode;
import android.preference.PreferenceManager;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.FragmentActivity;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Gravity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import sergentum.export.MifitStarter;
import sergentum.export.SettingsActivity;
import sergentum.export.core.Model.Track;
import sergentum.sync.EndomondoSyncronizer;

import java.util.Map;

import static sergentum.export.SettingsActivity.ENDOMONDO_APIKEY;
import static sergentum.export.Starter.TAG;

//import cn.com.smartdevices.bracelet.gps.ui.sport.detail.CodeActivity;

public class MainActivity extends AppCompatActivity {
    FragmentActivity activity;
    int mainActWindow;
    private FrameLayout root;
    private SharedPreferences sp;
    TextView sharedPrefView;
    FloatingActionButton fab;


    private int getResource(String name, String defType) {
        int identifier = getResources().getIdentifier(name, defType, getPackageName());
        Log.d(TAG, "Requested: " + name + ", found: " + identifier);
        return identifier;
    }

    @Override
    protected void onResume() {
        super.onResume();

        SharedPreferences sp = PreferenceManager.getDefaultSharedPreferences(this);
        Map<String, ?> all = sp.getAll();
        String spString = "";
        for (Map.Entry<String, ?> stringEntry : all.entrySet()) {
            spString = spString + stringEntry.getKey() + " - " + stringEntry.getValue() + "\r\n";
        }
        sharedPrefView.setText(spString);
        Log.i("mifit", spString);


        if (fab != null) {
            fab.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                            .setAction("Action", null).show();
                }
            });
            fab.show();
        }

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        sp = PreferenceManager.getDefaultSharedPreferences(this);
        super.onCreate(savedInstanceState);
        root = new FrameLayout(this);
        root.setLayoutParams(new FrameLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
        setContentView(root);

//        super.onCreate(savedInstanceState);
        activity = this;
//        setContentView(getResource("activity_main", "id"));
        Toolbar toolbar = (Toolbar) findViewById(getResource("toolbar", "toolbar"));
        setSupportActionBar(toolbar);


        // creating LinearLayout
        LinearLayout linLayout = new LinearLayout(this);
        // specifying vertical orientation
        linLayout.setOrientation(LinearLayout.VERTICAL);
        // creating LayoutParams
        LinearLayout.LayoutParams linLayoutParam = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT);
        // set LinearLayout as a root element of the screen
        setContentView(linLayout, linLayoutParam);


        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);

        Button btn = new Button(this);
        btn.setText("export settings");
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, SettingsActivity.class);
                startActivity(intent);
            }
        });
        linLayout.addView(btn, layoutParams);


        Button btn2 = new Button(this);
        btn2.setText("ExportActivity");
        btn2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (checkStoragePermission()) {
                    MifitStarter starter = new MifitStarter(MainActivity.this, true);
                    starter.showTracks();

                } else {
                    Toast.makeText(getApplicationContext(),
                            "don't have write storage permission", Toast.LENGTH_SHORT).show();
                }
            }
        });
        linLayout.addView(btn2, layoutParams);


        Button btn3 = new Button(this);
        btn3.setText("invoke synchronization");
        btn3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                MifitStarter mifitStarter = new MifitStarter(MainActivity.this, false);
                mifitStarter.invokeSync();
            }
        });
        linLayout.addView(btn3, layoutParams);

        Button export = new Button(this);
        export.setText("upload");
        export.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (checkStoragePermission()) {
                    StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
                    StrictMode.setThreadPolicy(policy);

                    MifitStarter start = new MifitStarter(MainActivity.this, true);

                    EndomondoSyncronizer endomondoSyncronizer =
                            new EndomondoSyncronizer(sp.getString(ENDOMONDO_APIKEY, null), start);

                    Track track = start.fetchTrackById(1555498976L);
                    endomondoSyncronizer.upload(track);

                } else {
                    Toast.makeText(getApplicationContext(),
                            "don't have write storage permission", Toast.LENGTH_SHORT).show();
                }
            }
        });
        linLayout.addView(export, layoutParams);


        sharedPrefView = new TextView(this);
        linLayout.addView(sharedPrefView, layoutParams);

        fab = new FloatingActionButton(this);
        CoordinatorLayout.LayoutParams lp = new CoordinatorLayout.LayoutParams(layoutParams);
        lp.anchorGravity = Gravity.CENTER; // or you can add Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL
        fab.setLayoutParams(lp);

//        layoutParams.gravity = Gravity.CENTER;
//        fab.setLayoutParams(layoutParams);
//
//        CoordinatorLayout.LayoutParams lp = new CoordinatorLayout.LayoutParams(fab.getLayoutParams());
//        lp.anchorGravity = Gravity.CENTER; // or you can add Gravity.CENTER_VERTICAL | Gravity.CENTER_HORIZONTAL
//        fab.setLayoutParams(lp);


        linLayout.addView(fab);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
//        getMenuInflater().inflate(R.menu.menu_main, menu);
        int resource = getResource("menu_main", "menu");
        getMenuInflater().inflate(resource, menu);

        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == getResource("action_settings", "id")) {
            Log.d(TAG, "settings called");
//            Intent intent = new Intent(this, ExportActivity.class);
//            startActivity(intent);
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @TargetApi(Build.VERSION_CODES.M)
    public boolean checkStoragePermission() {
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

    @Override
    protected void onResumeFragments() {
//        super.onResumeFragments();
        System.out.println("mifit method onResumeFragments");

        printClassHierarchy(this);
    }

    private static void printClassHierarchy(Object object) {
        Class<?> aClass = object.getClass();
        while (true) {
            Class<?> superclass = aClass.getSuperclass();
            if (superclass != null) {
                System.out.println(superclass);
                aClass = superclass;
            } else {
                break;
            }
        }
        System.out.println(aClass);
    }


}
