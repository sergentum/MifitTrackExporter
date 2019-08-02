package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.RawData.*;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackExporter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.MifitStarter.EXT_DB_NAME;
import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.MifitStarter.mapRawDataToQueryData;

public class ConsoleStarter extends Starter{
    public List<RawTrackData> readRawDataFromDb() {
        ArrayList<RawTrackData> rawTrackDataList = new ArrayList<>();
        Connection conn = null;
        try {
            String url = "jdbc:sqlite:" + EXT_DB_NAME;
            conn = DriverManager.getConnection(url);

            System.out.println("Connection to SQLite has been established.");

            Statement statement = conn.createStatement();

            String args = "SELECT " +
                    "TRACKDATA.TRACKID," +
                    "TRACKDATA.SIZE," +
                    "TRACKDATA.BULKLL," +
                    "TRACKDATA.BULKGAIT," +
                    "TRACKDATA.BULKAL," +
                    "TRACKDATA.BULKTIME," +
                    "TRACKDATA.BULKHR," +
                    "TRACKDATA.BULKPACE," +
                    "TRACKDATA.BULKPAUSE," +
                    "TRACKDATA.BULKSPEED," +
                    "TRACKDATA.TYPE," +
                    "TRACKDATA.BULKFLAG," +
                    "TRACKRECORD.COSTTIME," +
                    "TRACKRECORD.ENDTIME, " +
                    "TRACKRECORD.DISTANCE " +
                    "FROM TRACKDATA, TRACKRECORD " +
                    "WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID "
//                            + "AND TRACKDATA.TRACKID = *"
                    ;

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
        return rawTrackDataList;
    }

   public boolean log(String string) {
       System.out.println(string);
       return true;
   }

   public void showToast(String string, int length) {
       System.out.println("toast:" + string);
   }
}
