package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.Model;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.RawData.QueryData;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackExporter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class ConsoleStarter extends Starter{
    private static final String LOCAL_DB_URL = "jdbc:sqlite:" + EXT_DB_NAME;

    @Override
    public Map<Long, Model.TrackHeader> loadTrackHeadersFromDb() {
        try (Connection conn = DriverManager.getConnection(LOCAL_DB_URL)) {
            System.out.println("Connection to SQLite has been established.");
            Statement statement = conn.createStatement();

            ResultSet rs = statement.executeQuery(TRACK_ID_QUERY);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            StringBuilder stringBuilder = new StringBuilder();
            Map<Long, Model.TrackHeader> trackHeaderMap = new TreeMap<>();
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

                Model.TrackHeader trackHeader = new Model.TrackHeader();
                long trackId = rs.getLong(1);
                trackHeader.id = trackId;
                trackHeader.type = rs.getInt(2);
                trackHeader.distance = rs.getInt(3);
                trackHeader.duration = rs.getInt(4);
                trackHeaderMap.put(trackId, trackHeader);
            }
            return trackHeaderMap;
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }

    @Override
    public void showTracks() {
        Map<Long, Model.TrackHeader> trackHeaderMap = loadTrackHeadersFromDb();
        Set<Map.Entry<Long, Model.TrackHeader>> entries = trackHeaderMap.entrySet();
        int i = 1;
        Map<Integer, Long> noIdMap = new HashMap<>();
        for (Map.Entry<Long, Model.TrackHeader> entry : entries) {
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
                    Model.TrackHeader trackHeader = trackHeaderMap.get(trackId);
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
    public void readRawDataWithId(long id) {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(LOCAL_DB_URL);
            System.out.println("Connection to SQLite has been established.");
            Statement statement = conn.createStatement();

            String args = TRACK_DATA_QUERY + id;

            ResultSet rs = statement.executeQuery(args);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            boolean header = true;
            ArrayList<QueryData> queryDataList = new ArrayList<>();
            while (rs.next()) {
                QueryData queryData = new QueryData();
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
                queryDataList.add(queryData);
            }

            // show coarse data
            for (QueryData queryData : queryDataList) {
                System.out.println(queryData);
            }

            TrackExporter trackExporter = new TrackExporter(this);
            trackExporter.launchExport(queryDataList);

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
    }
}
