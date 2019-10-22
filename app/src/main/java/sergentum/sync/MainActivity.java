package sergentum.sync;

import android.Manifest;
import android.annotation.TargetApi;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.FragmentActivity;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
//import cn.com.smartdevices.bracelet.gps.ui.sport.detail.CodeActivity;
import sergentum.export.SettingsActivity;
import sergentum.export.MifitStarter;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

import static sergentum.export.SettingsActivity.ENDOMONDO_APIKEY;
import static sergentum.export.Starter.TAG;

public class MainActivity extends AppCompatActivity {
    FragmentActivity activity;
    int mainActWindow;

    private FrameLayout root;

    private SharedPreferences sp;

    private int getResource(String name, String defType) {
        int identifier = getResources().getIdentifier(name, defType, getPackageName());
        Log.d(TAG, "Requested: " + name + ", found: " + identifier);
        return identifier;
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

//        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
//        fab.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
//                        .setAction("Action", null).show();
//
////                FragmentManager fragmentManager = activity.getFragmentManager();
////                FragmentTransaction fragmentTransaction = fragmentManager.beginTransaction();
////                fragmentTransaction.replace(R.id.mainFragment , prefFrag);
////                fragmentTransaction.commit();
//
////                Intent intent = new Intent(MainActivity.this, CodeActivity.class);
////                startActivity(intent);
//            }
//        });

        // creating LinearLayout
        LinearLayout linLayout = new LinearLayout(this);
        // specifying vertical orientation
        linLayout.setOrientation(LinearLayout.VERTICAL);
        // creating LayoutParams
        LinearLayout.LayoutParams linLayoutParam = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT);
        // set LinearLayout as a root element of the screen
        setContentView(linLayout, linLayoutParam);

        LinearLayout.LayoutParams lpView = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);

        Button btn = new Button(this);
        btn.setText("export settings");
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, SettingsActivity.class);
                startActivity(intent);
            }
        });
        linLayout.addView(btn, lpView);


        Button btn2 = new Button(this);
        btn2.setText("ExportActivity");
        btn2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (checkStoragePermission()) {
                    MifitStarter starter = new MifitStarter(MainActivity.this);
                    starter.showTracks();

                } else {
                    Toast.makeText(getApplicationContext(),
                            "don't have write storage permission", Toast.LENGTH_SHORT).show();
                }
            }
        });
        linLayout.addView(btn2, lpView);



        Button btn3 = new Button(this);
        btn3.setText("get workouts");
        btn3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

//                Intent intent = new Intent(MainActivity.this, SettingsActivity.class);
//                startActivity(intent);
                String string = sp.getString(ENDOMONDO_APIKEY, "");
                EndomondoSynchronizer synchronizer = new EndomondoSynchronizer();
                synchronizer.authToken = string;
                EndomondoSynchronizer.GetFeedTask getFeedTask = new EndomondoSynchronizer.GetFeedTask(synchronizer);

                FutureTask<DefSynchronizer.Status> futureTask = new FutureTask<>(getFeedTask);
                new Thread(futureTask).start();

                try {
                    DefSynchronizer.Status status = futureTask.get();
                    System.out.println(status);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (ExecutionException e) {
                    e.printStackTrace();
                }

            }
        });
        linLayout.addView(btn3, lpView);


        SharedPreferences sp = PreferenceManager.getDefaultSharedPreferences(this);
        Map<String, ?> all = sp.getAll();
        String spString = "";
        for (Map.Entry<String, ?> stringEntry : all.entrySet()) {
            spString = spString + stringEntry.getKey() + " - " + stringEntry.getValue() + "\r\n";
        }
        TextView spView = new TextView(this);
        spView.setText(spString);
        Log.i("mifit", spString);
        linLayout.addView(spView, lpView);


//        Intent intent = new Intent(this, ExportActivity.class);
//        startActivity(intent);
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
}
