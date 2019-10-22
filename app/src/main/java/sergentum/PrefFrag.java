//package cn.com.smartdevices.bracelet.gps.ui.sport.detail;
//
//import android.content.SharedPreferences;
//import android.os.Bundle;
//import android.preference.ListPreference;
//import android.preference.Preference;
//import android.preference.PreferenceFragment;
//import android.preference.PreferenceScreen;
//
//public class PrefFrag extends PreferenceFragment implements SharedPreferences.OnSharedPreferenceChangeListener {
//    @Override
//    public void onCreate(Bundle savedInstanceState) {
//        super.onCreate(savedInstanceState);
//
//        PreferenceScreen p = createPreferences();
//        this.setPreferenceScreen(p);//Set the PreferenceScreen as the current one on this fragment
//
//        //now bind values, notice we use p.findPreference which means whe look into the preferenceScreen Associated with the PreferenceFragment/Activity
//        bindPreferenceSummaryToValue(p.findPreference("some_key"));
//    }
//
//    private PreferenceScreen createPreferences()
//    {
//        PreferenceScreen p = getPreferenceManager().createPreferenceScreen(getActivity());
//
//        ListPreference listPref = new ListPreference(getActivity());
//
//        listPref.setKey("some_key"); //Refer to get the pref value
//        CharSequence[] csEntries = new String[]{"Item1","Item2"};
//        CharSequence[] csValues = new String[]{"1","2"};
//        listPref.setDefaultValue("");
//        listPref.setEntries(csEntries); //Entries(how you display them)
//        listPref.setEntryValues(csValues);//actual values
//        listPref.setDialogTitle("Dialog title");
//        listPref.setTitle("Title");
//        listPref.setSummary("Some summary");
//
//        p.addPreference(listPref);
//
//        return p;
//    }
//
//    private static void bindPreferenceSummaryToValue(Preference preference) {
//        // Set the listener to watch for value changes.
////        preference.setOnPreferenceChangeListener(sBindPreferenceSummaryToValueListener);
//
//        System.out.println("-------pref " + preference);
//
//        // Trigger the listener immediately with the preference's
//        // current value.
//
//
////        if (preference instanceof CheckBoxPreference) {
////            sBindPreferenceSummaryToValueListener.onPreferenceChange(preference, PreferenceManager.
////                    getDefaultSharedPreferences(preference.getContext()).
////                    getBoolean(preference.getKey(),false));
////
////        } else {
////            sBindPreferenceSummaryToValueListener.onPreferenceChange(preference, PreferenceManager.
////                    getDefaultSharedPreferences(preference.getContext()).
////                    getString(preference.getKey(),""));
////        }
//
//    }
//
//    @Override
//    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
//        System.out.println("------------ " + sharedPreferences + " " + key);
//    }
//}
