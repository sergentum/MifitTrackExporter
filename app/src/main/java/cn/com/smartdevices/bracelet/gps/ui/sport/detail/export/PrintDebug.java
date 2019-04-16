package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import java.io.File;
import java.util.ArrayList;

public class PrintDebug {
    public static String printRawPoints(
            long startTime,
            ArrayList<TrackPoint> hrTrackPoints,
            ArrayList<TrackPoint> coordTrackPoints,
            ArrayList<TrackPoint> stepTrackPoints
    ) {
        StringBuilder trackPointsBuilder = new StringBuilder();

        int csvSize = hrTrackPoints.size() > coordTrackPoints.size() ? hrTrackPoints.size() : coordTrackPoints.size();
        for (int i = 0; i < csvSize; i++) {
            if (i < coordTrackPoints.size()) {
                TrackPoint trackPoint = coordTrackPoints.get(i);
                trackPointsBuilder.append(trackPoint.altitude).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.latitude).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.longitude).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackPoint.formatTimestamp(trackPoint.timestamp)).append(ExportTrack.CSV_COLUMN_DELIMITER);
            } else {
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
            }

            if (i < hrTrackPoints.size()) {
                TrackPoint trackPoint = hrTrackPoints.get(i);
                trackPointsBuilder.append(TrackPoint.formatTimestamp(trackPoint.timestamp)).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.heartRate).append(ExportTrack.CSV_COLUMN_DELIMITER);
            } else {
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
            }

            if (i < stepTrackPoints.size()) {
                TrackPoint trackPoint = stepTrackPoints.get(i);
                trackPointsBuilder.append(TrackPoint.formatTimestamp(trackPoint.timestamp)).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append("second").append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.cadence).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.stride).append(ExportTrack.CSV_COLUMN_DELIMITER);
            } else {
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(ExportTrack.EMPTY_VALUE).append(ExportTrack.CSV_COLUMN_DELIMITER);
            }
            trackPointsBuilder.append("\r\n");
        }
        return trackPointsBuilder.toString();
    }

    static boolean checkOrCreateFilePath(String filepath) {
        File file = new File(filepath).getParentFile();
        if (!file.exists()) {
            return file.mkdirs();
        } else return false;
    }
}
