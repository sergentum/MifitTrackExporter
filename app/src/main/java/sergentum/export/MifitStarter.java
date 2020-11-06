package sergentum.export;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Environment;
import android.preference.PreferenceManager;
import android.util.Log;
import android.widget.Toast;

import sergentum.export.core.Model.Track;
import sergentum.export.core.Model.TrackSummary;
import sergentum.export.core.RawData.QueryData;
import sergentum.export.core.TrackExporter;
import sergentum.sync.EndomondoSyncronizer;
import sergentum.sync.SergSynchronizer.Status;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.regex.Pattern;

import static sergentum.export.SettingsActivity.ENDOMONDO_APIKEY;
import static sergentum.export.core.TrackExporter.mi2sport;


public class MifitStarter extends Starter {
    private Activity activity;
    private String dbPath;
    private String logFilePath;
    private SharedPreferences sp;
    private final boolean UIthread;

    private static final String TMP_DB_QUERY = "" +
            "CREATE TABLE IF NOT EXISTS dummy " +
            "(\"_id\"  INTEGER primary key autoincrement, \n" +
            "  \"CALENDAR\" INTEGER )";

    public MifitStarter(Activity activity) {
        this.activity = activity;
        UIthread = true;
        init();
    }

    public MifitStarter(Activity activity, boolean UIthread) {
        this.activity = activity;
        this.UIthread = UIthread;
        init();
    }

    private void init() {
        DEVICE_PATH = Environment.getExternalStorageDirectory().getPath() + "/";
        sp = PreferenceManager.getDefaultSharedPreferences(activity);
        FILE_FORMAT = sp.getString("export_format", "");
        debug = sp.getBoolean("debug", false);
        Log.e(TAG, "TrackExporter.debug: " + debug);
        // TODO: 2019-04-23 add ru lang
        String language = Locale.getDefault().getLanguage();
        Log.e(TAG, "Locale.getDefault().getLanguage(): " + language);

        if (checkLogFilePath()) {
            dbPath = getDbPath();
        } else {
            Toast.makeText(activity, "can't get access to filesystem", Toast.LENGTH_SHORT).show();
            Log.e(TAG, "can't get access to filesystem");
        }
    }

    public void invokeSync() {
        log("invokeSync");
        Thread t = new Thread(new EndoRunnable(this));
        t.start();
    }

    void synchronize() {
        long start = System.currentTimeMillis();
        int counterToUpload = 0;
        try {
            log("synchronize called");
            // check if endomondo enabled
            String endoApi = sp.getString(ENDOMONDO_APIKEY, "");
            if (endoApi.length() < 8) {
                log("Endomondo sync isn't enabled");
                return;
            }

            // if sync was enabled just now, so we store timestamp of that moment
            long syncOnDate = sp.getLong(LAST_TRACK_DATE, 0L);
            if (syncOnDate == 0) {
                syncOnDate = new Date().getTime();
                // we store current time minus 24 hrs as last sync date
                sp.edit().putLong(LAST_TRACK_DATE, syncOnDate - 86400000).apply();
                return;
            }

            Date lastTrackDate = new Date(syncOnDate);

            TreeMap<Long, TrackSummary> longTrackSummaryTreeMap = loadTrackSummaryFromDb();
            for (Map.Entry<Long, TrackSummary> entry : longTrackSummaryTreeMap.entrySet()) {
                TrackSummary value = entry.getValue();
                Date date = new Date(value.startTime);
                if (lastTrackDate.before(date)) {
                    exportTrack(value.id);
                    log("Track with " + value.id + " uploaded");
                    counterToUpload++;
                    boolean commit = sp.edit().putLong(LAST_TRACK_DATE, date.getTime()).commit();
                    if (commit) {
                        log("Track with " + value.id + " marked as uploaded");
                    } else {
                        log("Track with " + value.id + " WASN'T marked as uploaded");
                    }
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            Log.e(TAG, "Can't sync: ", ex);
        }
        long stop = System.currentTimeMillis();
        log(String.format("Sync took %s ms for %s tracks", stop - start, counterToUpload));
    }

    @Override
    public TreeMap<Long, TrackSummary> loadTrackSummaryFromDb() {
        TreeMap<Long, TrackSummary> trackSummaryMap = new TreeMap<>();
        if (dbPath == null) {
            Toast.makeText(activity, "database not found", Toast.LENGTH_SHORT).show();
        } else {
            try (
                    SQLiteDatabase sqLiteDatabase = activity.openOrCreateDatabase(dbPath, Context.MODE_PRIVATE, null);
                    Cursor cursor = sqLiteDatabase.rawQuery(TRACK_ID_QUERY, null)
            ) {
                cursor.moveToFirst();
                StringBuilder stringBuilder = new StringBuilder();
                while (!cursor.isAfterLast()) {

                    TrackSummary trackHeader = new TrackSummary();
                    for (int i = 0; i < cursor.getColumnCount(); i++) {
                        stringBuilder.append(cursor.getString(i)).append(" ");
                        if (i == 0) {
                            String string = cursor.getString(i);
                            long l = Long.parseLong(string);
                            Date date = new Date(l * 1000);
                            trackHeader.startTime = date.getTime();
                            stringBuilder.append(date).append(" ");
                        }
                    }
                    stringBuilder.append("\n");

                    long trackId = cursor.getLong(0);
                    trackHeader.id = trackId;
                    int miSportType = cursor.getInt(1);
                    trackHeader.activityType = mi2sport.get(miSportType);
                    trackHeader.distance = cursor.getInt(2);
                    trackHeader.duration = cursor.getInt(3);
                    trackSummaryMap.put(trackId, trackHeader);
                    cursor.moveToNext();
                }
                cursor.close();
                sqLiteDatabase.close();
                log(stringBuilder.toString());
            } catch (Exception e) {
                log("showTracks():" + e.getMessage());
            }
        }
        log("trackHeaderMap.size(): " + trackSummaryMap.size());
        return trackSummaryMap;
    }

    public void showTracks() {
        TreeMap<Long, TrackSummary> trackSummaryTreeMap = loadTrackSummaryFromDb();

        boolean settingsScreenExist = true;
        ArrayList<Long> trackIds = new ArrayList<>();
        String[] trackDesc;
        Set<Map.Entry<Long, TrackSummary>> entries = trackSummaryTreeMap.descendingMap().entrySet();
        int i = 0;

        if (settingsScreenExist) {
            // this item means call settings
            trackIds.add(0L);
            trackDesc = new String[trackSummaryTreeMap.size() + 1];
            trackDesc[0] = "-- export settings --";

            i++;
        } else {
            trackDesc = new String[trackSummaryTreeMap.size()];
        }

        for (Map.Entry<Long, TrackSummary> entry : entries) {
            trackIds.add(entry.getKey());
            trackDesc[i] = entry.getValue().toString();
            i++;
        }

        ChooseTrackClickListener trackChooseListener = new ChooseTrackClickListener(trackIds);

        AlertDialog.Builder alert = new AlertDialog.Builder(activity);
        alert.setTitle("Choose track to export:");
        alert.setItems(trackDesc, trackChooseListener);
        alert.create().show();
    }

    public class ChooseTrackClickListener implements DialogInterface.OnClickListener {
        private ArrayList<Long> trackIds;

        ChooseTrackClickListener(ArrayList<Long> trackIds) {
            this.trackIds = trackIds;
        }

        public void onClick(DialogInterface dialogInterface, int i) {
            Long trackId = trackIds.get(i);
            if (trackId == 0) {
                Intent intent = new Intent(MifitStarter.this.activity, SettingsActivity.class);
                MifitStarter.this.activity.startActivity(intent);
            } else {
                try {
                    exportTrack(trackId);
                } catch (Exception e) {
                    e.printStackTrace();
                    log("Export error:", e);
                }
            }
        }
    }

    public Track fetchTrackById(Long trackId) {
        QueryData queryData = readRawDataWithId(trackId);

        TrackExporter trackExporter = new TrackExporter(this);
        Track track = trackExporter.compileTrack(queryData);
        return track;
    }

    public void exportTrack(Long trackId) throws Exception {
        Track track = fetchTrackById(trackId);
        long start = System.currentTimeMillis();
        String message = "";
        log("Format selected: " + FILE_FORMAT);
        switch (FILE_FORMAT) {
            case ".tcx": {
                message += exportTCX(track);
                message += "\nsaved to " + EXPORT_PATH;
                break;
            }
            case ".gpx": {
                message += exportGPX(track);
                message += "\nsaved to " + EXPORT_PATH;
                break;
            }
            case "endomondo": {
                String endoApiKey = sp.getString(ENDOMONDO_APIKEY, null);
                EndomondoSyncronizer endomondoSyncronizer = new EndomondoSyncronizer(endoApiKey, this);
                Status upload = endomondoSyncronizer.upload(track);
                message += upload.message;
                break;
            }
            default: {
                message += exportTCX(track);
                message += "\n" + exportGPX(track);
                break;
            }
        }
        long stop = System.currentTimeMillis();
        String successMessage = message + "\n Spent " + (stop - start) + " ms ";
        log(successMessage);
        showToast(successMessage, 1);
    }

    public QueryData readRawDataWithId(long id) {
        QueryData queryData = new QueryData();
        try (
                SQLiteDatabase sqLiteDatabase = activity.openOrCreateDatabase(dbPath, Context.MODE_PRIVATE, null);
                Cursor cursor = sqLiteDatabase.rawQuery(TRACK_DATA_QUERY + id, null)
        ) {
            cursor.moveToFirst();
            if (!cursor.isAfterLast()) {
                for (int i = 0; i < cursor.getColumnCount(); i++) {
                    String columnValue = cursor.getString(i);
                    String columnName = cursor.getColumnName(i);
                    mapRawDataToQueryData(queryData, columnName, columnValue);
                }
            } else {
                log("There is no track entry in db with such id: " + id);
            }
        } catch (Exception e) {
            log("readRawDataWithId(" + id + "):" + e.getMessage());
        }
        return queryData;
    }

    private String getDbPath() {
        String result = checkExtDb();
        if (result == null) {
            result = findOriginDb();
        }
        return result;
    }

    private String checkExtDb() {
        String result;
        String mifit_dir_path = getFullPath();
        checkIfPathExistAndCreate(mifit_dir_path);
        File mifit_dir = new File(mifit_dir_path);
        log("search for external db: " + mifit_dir_path + EXT_DB_NAME);
        if (mifit_dir.exists()) {
            try {
                String[] list = mifit_dir.list();
                for (String fileName : list) {
                    File curFile = new File(mifit_dir_path, fileName);
                    if (!curFile.isDirectory() && curFile.getName().contains(EXT_DB_NAME)) {
                        result = curFile.getPath();
                        log("ext db found:" + result);
                        showToast("ext db found:" + result, 0);
                        return result;
                    }
                }
            } catch (Exception ex) {
                log("checkExtDb():" + ex.getMessage());
            }
        }
        log("ext db not found");
        return null;
    }

    String findOriginDb() {
        Pattern pattern = Pattern.compile("^origin_db_[A-Za-z0-9]*$");

        String pathToDb = dbPathFinder();
        String pathToOriginDb;
        File directory = new File(pathToDb);
        String[] list = directory.list();

        for (String file : list) {
            boolean dbFound = pattern.matcher(file).find();
            log("file:" + file + " matches:" + dbFound);
            if (dbFound) {
                File dbFile = new File(pathToDb, file);
                pathToOriginDb = dbFile.getPath();
                log("origin db found: " + pathToOriginDb);
                return pathToOriginDb;
            }
        }

        log("origin db not found");
        return null;
    }

    private String dbPathFinder() {
        SQLiteDatabase sqLiteDatabase = activity.openOrCreateDatabase("tmp.db", Context.MODE_PRIVATE, null);
        sqLiteDatabase.execSQL(TMP_DB_QUERY);
        String tmpDbPath = sqLiteDatabase.getPath();
        sqLiteDatabase.close();
        File tmpDb = new File(tmpDbPath);
        log("origin db path:" + tmpDb.getParent());
        return tmpDb.getParent();
    }

    private boolean checkLogFilePath() {
        String filePath = getDebugPath();
        logFilePath = filePath + DEBUG_LOG_FILE;
        if (checkIfPathExistAndCreate(filePath)) {
            return log(".");
        } else {
            return false;
        }
    }

    @Override
    public boolean log(String... args) {
        String arrAsSingleString = super.stringArrayToString(args);
        try (FileWriter fileWriter = new FileWriter(logFilePath, true)) {
            fileWriter.write(arrAsSingleString);
            fileWriter.flush();
        } catch (Exception e) {
            Log.e(TAG, "Ex while logging:", e);
            return false;
        } finally {
            Log.d(TAG, arrAsSingleString);
        }
        return true;
    }

    @Override
    public void showToast(String string, int length) {
        if (UIthread) {
            Toast.makeText(activity, string, length).show();
        }
    }
}
