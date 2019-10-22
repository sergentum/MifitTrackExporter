//package cn.com.smartdevices.bracelet.gps.ui.sport.detail;
//
//import android.app.Activity;
//import android.content.Intent;
//import android.content.SharedPreferences;
//import android.os.Bundle;
//import android.preference.PreferenceManager;
//import android.support.v7.app.AppCompatActivity;
//import android.view.Gravity;
//import android.view.Menu;
//import android.view.MenuItem;
//import android.widget.Button;
//import android.widget.LinearLayout;
//import android.widget.TextView;
//import com.example.username.mifittrackexporter.R;
//
//public class CodeActivity extends AppCompatActivity {
//    /** Called when the activity is first created. */
//    @Override
//    public void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//        // creating LinearLayout
//        LinearLayout linLayout = new LinearLayout(this);
//        // specifying vertical orientation
//        linLayout.setOrientation(LinearLayout.VERTICAL);
//        // creating LayoutParams
//        LinearLayout.LayoutParams linLayoutParam = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT);
//        // set LinearLayout as a root element of the screen
//        setContentView(linLayout, linLayoutParam);
//
//        LinearLayout.LayoutParams lpView = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
//
//        TextView tv = new TextView(this);
//        tv.setText("TextView");
//        tv.setLayoutParams(lpView);
//        linLayout.addView(tv);
//
//        Button btn = new Button(this);
//        btn.setText("Button");
//        linLayout.addView(btn, lpView);
//
//
//        LinearLayout.LayoutParams leftMarginParams = new LinearLayout.LayoutParams(
//                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
//        leftMarginParams.leftMargin = 50;
//
//        Button btn1 = new Button(this);
//        btn1.setText("Button1");
//        linLayout.addView(btn1, leftMarginParams);
//
//
//        LinearLayout.LayoutParams rightGravityParams = new LinearLayout.LayoutParams(
//                LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
//        rightGravityParams.gravity = Gravity.RIGHT;
//
//        Button btn2 = new Button(this);
//        btn2.setText("Button2");
//        linLayout.addView(btn2, rightGravityParams);
//    }
//}
