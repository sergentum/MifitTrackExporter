package cn.com.smartdevices.bracelet.gps.ui.sport.detail;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

public class ExportView extends View {

    public ExportView(final Context context) {
        super(context);

        LinearLayout linearLayout = new LinearLayout(context);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.FILL_PARENT,
                LinearLayout.LayoutParams.FILL_PARENT);
        this.setLayoutParams(layoutParams);
        Button btn1 = new Button(context);
        btn1.setText("Button_text");
        linearLayout.addView(btn1);
        btn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // put code on click operation
                System.out.println("onClick pressed");
            }
        });
    }

    public void init() {
        System.out.println("ExportView init");
    }
}
