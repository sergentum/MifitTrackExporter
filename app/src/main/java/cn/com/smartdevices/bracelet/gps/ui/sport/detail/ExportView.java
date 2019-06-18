package cn.com.smartdevices.bracelet.gps.ui.sport.detail;

import android.content.Context;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

public class ExportView extends View {
    LinearLayout.LayoutParams layoutParams;

    public ExportView(final Context context) {
        super(context);
        layoutParams = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.FILL_PARENT,LinearLayout.LayoutParams.FILL_PARENT);

        System.out.println("ExportView created");
        LinearLayout l_layout = new LinearLayout(context);
        l_layout.setOrientation(LinearLayout.VERTICAL);
        l_layout.setLayoutParams(new LinearLayout.LayoutParams(100, 100));
        Button btn1 = new Button(context);
        btn1.setText("Button_text");

        l_layout.addView(btn1);

        btn1.setOnClickListener(new OnClickListener()
        {
            @Override
            public void onClick(View v) {
                // put code on click operation
                Toast onClick = Toast.makeText(context, "onClick", Toast.LENGTH_SHORT);
                onClick.show();
            }
        });
    }

    public void init(){
        System.out.println("ExportView init");
    }

    @Override
    public LinearLayout.LayoutParams getLayoutParams() {
        return layoutParams;
    }
}
