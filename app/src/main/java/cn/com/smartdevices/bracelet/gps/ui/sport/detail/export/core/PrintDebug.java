package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.Model.*;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.Model.formatTimestamp;

class PrintDebug {
    static String printRawPoints(
            ArrayList<TrackPoint> hrTrackPoints,
            Map<Long, TrackPoint> coordTrackPoints,
            Map<Long, TrackPoint> stepTrackPoints
    ) {
        StringBuilder trackPointsBuilder = new StringBuilder();

        int csvSize = hrTrackPoints.size() > coordTrackPoints.size() ? hrTrackPoints.size() : coordTrackPoints.size();
        Iterator<Map.Entry<Long, TrackPoint>> iteratorCoords = coordTrackPoints.entrySet().iterator();
        Iterator<Map.Entry<Long, TrackPoint>> iteratorSteps = stepTrackPoints.entrySet().iterator();
        for (int i = 0; i < csvSize; i++) {

            if (i < hrTrackPoints.size()) {
                TrackPoint trackPoint = hrTrackPoints.get(i);
                trackPointsBuilder.append(formatTimestamp(trackPoint.timestamp)).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.heartRate).append(TrackExporter.CSV_COLUMN_DELIMITER);
            } else {
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
            }

            if (iteratorCoords.hasNext()) {
                TrackPoint trackPoint = iteratorCoords.next().getValue();
                trackPointsBuilder.append(trackPoint.altitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.latitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(trackPoint.longitude).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(formatTimestamp(trackPoint.timestamp)).append(TrackExporter.CSV_COLUMN_DELIMITER);
            } else {
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
                trackPointsBuilder.append(TrackExporter.EMPTY_VALUE).append(TrackExporter.CSV_COLUMN_DELIMITER);
            }

            if (iteratorSteps.hasNext()) {
                TrackPoint trackPoint = iteratorSteps.next().getValue();
                trackPointsBuilder.append(formatTimestamp(trackPoint.timestamp)).append(TrackExporter.CSV_COLUMN_DELIMITER);
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
