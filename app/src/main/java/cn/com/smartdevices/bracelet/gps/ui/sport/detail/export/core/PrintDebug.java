package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

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
                trackPointsBuilder.append(trackPoint.altitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.latitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.longitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackPoint.formatTimestamp(trackPoint.timestamp)).append(TrackExporter.CSV_COLUMN_DELIMITER);
            } else {
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
            }

            if (i < hrTrackPoints.size()) {
                TrackPoint trackPoint = hrTrackPoints.get(i);
                trackPointsBuilder.append(TrackPoint.formatTimestamp(trackPoint.timestamp)).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.heartRate).append(TrackExporter.CSV_COLUMN_DELIMITER);
            } else {
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
            }

            if (i < stepTrackPoints.size()) {
                TrackPoint trackPoint = stepTrackPoints.get(i);
                trackPointsBuilder.append(TrackPoint.formatTimestamp(trackPoint.timestamp)).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append("second").append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.cadence).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.stride).append(TrackExporter.CSV_COLUMN_DELIMITER);
            } else {
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
            }
            trackPointsBuilder.append("\r\n");
        }
        return trackPointsBuilder.toString();
    }
}
