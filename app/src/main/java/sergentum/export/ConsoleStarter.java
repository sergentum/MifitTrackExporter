package sergentum.export;

import sergentum.export.core.Model;
import sergentum.export.core.RawData.QueryData;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import static sergentum.export.core.TrackExporter.mi2sport;

public class ConsoleStarter extends Starter {
    private static final String LOCAL_DB_URL = "jdbc:sqlite:" + EXT_DB_NAME;

    @Override
    public TreeMap<Long, Model.TrackSummary> loadTrackSummaryFromDb() {
        try (Connection conn = DriverManager.getConnection(LOCAL_DB_URL)) {
            System.out.println("Connection to SQLite has been established.");
            Statement statement = conn.createStatement();

            ResultSet rs = statement.executeQuery(TRACK_ID_QUERY);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            StringBuilder stringBuilder = new StringBuilder();
            TreeMap<Long, Model.TrackSummary> trackHeaderMap = new TreeMap<>();
            while (rs.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    stringBuilder.append(rs.getString(i)).append(" ");
                    if (i == 1) {
                        String string = rs.getString(i);
                        long l = Long.parseLong(string);
                        Date date = new Date(l * 1000);
                        stringBuilder.append(date).append(" ");
                    }
                }
                stringBuilder.append("\n");

                Model.TrackSummary summary = new Model.TrackSummary();
                long trackId = rs.getLong(1);
                summary.id = trackId;
                int miSportType = rs.getInt(2);
                summary.activityType = mi2sport.get(miSportType);
                summary.distance = rs.getInt(3);
                summary.duration = rs.getInt(4);
                trackHeaderMap.put(trackId, summary);
            }
            return trackHeaderMap;
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    @Override
    public void showTracks() {
        TreeMap<Long, Model.TrackSummary> trackSummaryMap = loadTrackSummaryFromDb();
        Set<Map.Entry<Long, Model.TrackSummary>> entries = trackSummaryMap.entrySet();
        int i = 1;
        Map<Integer, Long> noIdMap = new HashMap<>();
        for (Map.Entry<Long, Model.TrackSummary> entry : entries) {
            System.out.println("[" + i + "] id:" + entry.getKey() + " " + entry.getValue().toStringConsole());
            noIdMap.put(i, entry.getKey());
            i++;
        }
        System.out.println("Please enter the number of track (not id) to export or \'q\' to exit:");
        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in))) {
            String input = bufferedReader.readLine();
            while (!input.equals("q")) {
                int l = Integer.parseInt(input);
                Long trackId = noIdMap.get(l);
                if (trackId != null) {
                    Model.TrackSummary trackHeader = trackSummaryMap.get(trackId);
                    if (trackHeader != null) {
                        readRawDataWithId(trackHeader.id);
                    }
                } else {
                    System.out.println("you entered incorrect no");
                }
                input = bufferedReader.readLine();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public QueryData readRawDataWithId(long id) {
        Connection conn = null;
        QueryData queryData = new QueryData();
        try {
            conn = DriverManager.getConnection(LOCAL_DB_URL);
            System.out.println("Connection to SQLite has been established.");
            Statement statement = conn.createStatement();

            String args = TRACK_DATA_QUERY + id;

            ResultSet rs = statement.executeQuery(args);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            boolean header = true;
            while (rs.next()) {

                for (int i = 1; i <= columnCount; i++) {
                    if (header) {
                        for (int j = 1; j <= columnCount; j++) {
                            String columnName = rsmd.getColumnName(j);
                            System.out.print(columnName + " ");
                        }
                        System.out.println();
                        header = false;
                    }
                    String columnName = rsmd.getColumnName(i);
                    String columnValue = rs.getString(i);
                    mapRawDataToQueryData(queryData, columnName, columnValue);
                }
            }

            // show coarse data
            System.out.println(queryData);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return queryData;
    }
}
