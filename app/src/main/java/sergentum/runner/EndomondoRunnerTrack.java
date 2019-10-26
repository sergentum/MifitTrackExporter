package sergentum.runner;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.location.Location;

import java.io.IOException;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.TimeZone;

import sergentum.runner.Constants.*;

public class EndomondoRunnerTrack {

    private SQLiteDatabase mDB = null;
    private SimpleDateFormat simpleDateFormat = null;

    public EndomondoRunnerTrack(final SQLiteDatabase db) {
        mDB = db;
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss 'UTC'",
                Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    public static class Summary {
        public int sport;
        public long duration;
        public double distance;
        public Long hr;
    }

    public void export(final long activityId, final Writer writer, Summary summary)
            throws IOException {

        final String[] aColumns = {
                DB.ACTIVITY.NAME,
                DB.ACTIVITY.COMMENT,
                DB.ACTIVITY.START_TIME,
                DB.ACTIVITY.DISTANCE,
                DB.ACTIVITY.TIME,
                DB.ACTIVITY.SPORT,
                DB.ACTIVITY.AVG_HR
        };
        final Cursor cursor = mDB.query(DB.ACTIVITY.TABLE, aColumns, "_id = "
                + activityId, null, null, null, null);
        cursor.moveToFirst();

        final double distance = cursor.getDouble(3) / 1000; // in km
        final long duration = cursor.getLong(4);

        if (summary != null) {
            summary.hr = null;
            summary.distance = distance;
            summary.duration = duration;
            summary.sport = EndomondoRunnerSynchronizer.sport2endomondoMap.get(Sport.valueOf(cursor.getInt(5)));
            if (!cursor.isNull(6)) {
                summary.hr = cursor.getLong(6);
            }
        }
        cursor.close();

        emitWaypoints(activityId, writer);
    }

    private void emitWaypoints(final long activityId, final Writer writer) throws IOException {
        final String[] pColumns = {
                DB.LOCATION.LAP, // 0
                DB.LOCATION.TIME, // 1
                DB.LOCATION.LATITUDE, // 2
                DB.LOCATION.LONGITUDE, // 3
                DB.LOCATION.ALTITUDE, // 4
                DB.LOCATION.TYPE, // 5
                DB.LOCATION.HR // 6
        };

        final Cursor cursor = mDB.query(DB.LOCATION.TABLE, pColumns, DB.LOCATION.ACTIVITY
                + " = " + activityId, null, null, null, null);

        double distance = 0;
        Location lastLoc = null;
        try {
            if (cursor.moveToFirst()) {
                do {
                    Location l = new Location("Dill");
                    l.setLatitude(cursor.getDouble(2));
                    l.setLongitude(cursor.getDouble(3));
                    if (lastLoc != null) {
                        distance += l.distanceTo(lastLoc);
                    }
                    lastLoc = l;

                    // # timestamp;
                    // # type (2=start, 3=end, 0=pause, 1=resume);
                    // # latitude;
                    // # longitude;
                    // #    distance; km
                    // #    speed; km/h
                    // # alt;
                    // # hr;

                    writer.write(simpleDateFormat.format(new Date(cursor.getLong(1))));
                    final int type = cursor.getInt(5);
                    switch (type) {
                        case DB.LOCATION.TYPE_START:
                            writer.write(";2;");
                            break;
                        case DB.LOCATION.TYPE_END:
                            lastLoc = null;
                            writer.write(";3;");
                            break;
                        case DB.LOCATION.TYPE_PAUSE:
                            lastLoc = null;
                            writer.write(";0;");
                            break;
                        case DB.LOCATION.TYPE_RESUME:
                            writer.write(";1;");
                            break;
                        case DB.LOCATION.TYPE_GPS:
                        default:
                            writer.write(";;");
                    }
                    writer.write(Double.toString(cursor.getDouble(2)));
                    writer.write(';');
                    writer.write(Double.toString(cursor.getDouble(3)));
                    writer.write(';');
                    writer.write(Double.toString(distance / 1000)); // in km
                    writer.write(';');
                    // speed
//                    writer.write(Integer.toString(160));
                    writer.write(';');

                    // altitude
                    if (!cursor.isNull(4)) {
                        writer.write(Double.toString(cursor.getDouble(4)));
                    }
                    writer.write(';');

                    // hr
                    writer.write(Integer.toString(getRandomNumberInRange(120, 125)));
                    writer.write(';');

//                    cadence
                    writer.write(Integer.toString(getRandomNumberInRange(150, 160)));
                    writer.write(';');

//                    power
//                    writer.write(150);
                    writer.write(';');
                    writer.append('\n');
                } while (cursor.moveToNext());
            }
        } finally {
            if (cursor != null)
                cursor.close();
        }
    }

    private static int getRandomNumberInRange(int min, int max) {

        if (min >= max) {
            throw new IllegalArgumentException("max must be greater than min");
        }

        Random r = new Random();
        return r.nextInt((max - min) + 1) + min;
    }
}
