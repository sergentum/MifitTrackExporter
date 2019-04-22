package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.RawTrackData;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

    }

    private static List<RawTrackData> readRawDataFromDb() {
        ArrayList<RawTrackData> rawTrackDataList = new ArrayList<>();
        Connection conn = null;
        try {
            // db parameters
//            String url = "jdbc:sqlite:origin_db_pause.db";
            String url = "jdbc:sqlite:origin.db";
            // create a connection to the database
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
//                            "AND TRACKDATA.TRACKID = 1554686813"
                    ;

            ResultSet rs = statement.executeQuery(args);
            ResultSetMetaData rsmd = rs.getMetaData();
            while (rs.next()) {
//                RawTrackData rawData = TrackDataParser.parseRawData(rs, rsmd);
//                rawTrackDataList.add(rawData);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return rawTrackDataList;
    }
}
