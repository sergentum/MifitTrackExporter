/*
 * Copyright (C) 2012 jonas.oreland@gmail.com
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

package sergentum.runner;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.util.Pair;
import sergentum.runner.util.FormValues;
import sergentum.runner.util.SyncHelper;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public abstract class DefaultSynchronizer implements DefSynchronizer {

    final Set<String> cookies = new HashSet<>();
    final FormValues formValues = new FormValues();

    DefaultSynchronizer() {
        super();
        logout();
    }

    @Override
    public long getId() {
        return 0;
    }

    @Override
    public String getName() {
        return null;
    }

    @Override
    public int getIconId() {
        //0 is used if the resource id cannot be found
        return 0;
    }

    @Override
    public int getColorId() {
        return 0;
    }

    @Override
    public void init(ContentValues config) {
        //Note that only auth_config can be expected here
        //Other config can be retrieved from db in Upload()
    }

    @Override
    public String getAuthConfig() {
        return null;
    }

    public Intent getAuthIntent(Activity a) {
        return null;
    }

    @Override
    public boolean isConfigured() {
        return false;
    }

    @Override
    public void reset() {

    }

    @Override
    public Status connect() {
        return null;
    }

    /** Below are default empty methods from Synchronizer */
    public Status getAuthResult(int resultCode, Intent data) {
        return Status.OK;
    }

    public Status upload(SQLiteDatabase db, long mID) {
        Status s = Status.ERROR;
//        s.activityId = mID;
        return s;
    }

    public Status getExternalId(SQLiteDatabase db, Status uploadStatus) {
        return Status.ERROR;
    }

    public boolean checkSupport(DefSynchronizer.Feature f) {
        return false;
    }

    public Status listWorkouts(List<Pair<String, String>> list) {
        return Status.OK;
    }

    public void downloadWorkout(File dst, String key) throws Exception {
    }


    public void logout() {
        clearCookies();
        formValues.clear();
    }

//    public Status getFeed(FeedUpdater feedUpdater) {
//        return Status.OK;
//    }

    @Override
    public Status refreshToken() {
        return Status.ERROR;
    }

    void addCookies(HttpURLConnection conn) {
        boolean first = true;
        StringBuilder buf = new StringBuilder();
        for (String cookie : cookies) {
            if (!first)
                buf.append("; ");
            buf.append(cookie.split(";", 2)[0]);
            first = false;
        }
        conn.addRequestProperty("Cookie", buf.toString());
    }

    void getCookies(HttpURLConnection conn) {
        List<String> connCookies = conn.getHeaderFields().get("Set-Cookie");
        /*
         * work-around for weird android 2.2 bug ref
         * http://stackoverflow.com/questions
         * /9134657/nullpointer-exception-with-
         * cookie-on-android-2-2-works-fine-on-2-3-and-above
         */
        if (connCookies == null)
            connCookies = conn.getHeaderFields().get("set-cookie");

        if (connCookies != null) {
            cookies.addAll(connCookies);
        }
    }

    void clearCookies() {
        cookies.clear();
    }

    String getFormValues(HttpURLConnection conn) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder buf = new StringBuilder();
        String s;
        while ((s = in.readLine()) != null) {
            buf.append(s);
        }
        String html = buf.toString();
        Map<String, String> values = SyncHelper.parseHtml(html);
        formValues.putAll(values);
        return html;
    }

    @Override
    public Integer getAuthNotice() {
        return 0;
    }

    @Override
    public String getPublicUrl() {
        return null;
    }

    @Override
    public String getActivityUrl(String extId) { return null; }

    //Common helper
    //JSON getString() interprets null as the string "null"
    static String noNullStr(String s) { return ("null".equals(s)) ? null : s; }
}
