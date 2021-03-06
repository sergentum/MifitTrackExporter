package sergentum;


import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import java.util.Random;

import static android.graphics.Color.RED;

public class TestFragment extends Fragment {
    private View view;
    private Random random;

    @Override
    public View onCreateView(LayoutInflater inflater,
                             ViewGroup container,
                             Bundle savedInstanceState) {
        System.out.println("TestFragment onCreateView:" + this);
        Activity activity = getActivity();
        view = new View(activity);
        Button button = new Button(activity);
        button.setText("frg btn");
        button.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                System.out.println("Button on frg clicked");
            }
        });

//        container.addView(button);
        random = new Random();
        return view;
    }

    public void changeColor() {
        if (view != null) {
            int i = random.nextInt();
            view.setBackgroundColor(i);
            System.out.println("color changed to:" + i);
        } else {
            System.out.println("view = null");
        }
    }
}
