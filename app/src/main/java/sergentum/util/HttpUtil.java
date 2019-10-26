package sergentum.util;

import android.util.Log;
import org.json.JSONObject;

import java.io.BufferedReader;

import static sergentum.export.Starter.TAG;

public class HttpUtil {
    public static JSONObject parseKVP(BufferedReader in) {
        JSONObject obj = new JSONObject();
        try {
            int lineno = 0;
            String s;
            while ((s = in.readLine()) != null) {
                int c = s.indexOf('=');
                if (c == -1) {
                    obj.put("_" + Integer.toString(lineno), s);
                } else {
                    obj.put(s.substring(0, c), s.substring(c + 1));
                }
                lineno++;
            }
        } catch (Exception ex) {
            Log.e(TAG, ex.getMessage() + " " + ex.getCause());
        }
        return obj;
    }
}
