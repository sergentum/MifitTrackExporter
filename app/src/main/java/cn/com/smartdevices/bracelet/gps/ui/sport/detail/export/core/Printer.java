package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.Model.*;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.Model.formatTimestamp;

class Printer {
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

    static String printTcx(Track track) {
        return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "\n" +
                "<TrainingCenterDatabase " +
                "xsi:schemaLocation=\"" + "\n" +
                "http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 " + "\n" +
                "http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd\" " + "\n" +
                "xmlns:ns5=\"http://www.garmin.com/xmlschemas/ActivityGoals/v1\" " + "\n" +
                "xmlns:ns3=\"http://www.garmin.com/xmlschemas/ActivityExtension/v2\" " + "\n" +
                "xmlns:ns2=\"http://www.garmin.com/xmlschemas/UserProfile/v2\" " + "\n" +
                "xmlns=\"http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2\" " + "\n" +
                "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">" + "\n" +
                "<Activities>" + "\n" +
                "<Activity Sport=\"" + track.getActivityTypeDescription() + "\">" + "\n" +
                "<Id>" + formatTimestamp(track.startTime) + "</Id>" + "\n" +
                "<Lap StartTime=\"" + track.getStartTimeAsDate() + "\">" + "\n" +
                "<TotalTimeSeconds>" + (track.endTime - track.startTime) + "</TotalTimeSeconds>" + "\n" +
                "<DistanceMeters>" + track.distance + "</DistanceMeters>" + "\n" +
                "<Track>" + "\n" +
                printTcxPoints(track) +
                "</Track>" + "\n" +
                "</Lap>" + "\n" +
                "</Activity>" + "\n" +
                "</Activities>" + "\n" +
                "</TrainingCenterDatabase>";
    }

    private static String printTcxTime(Long timestamp) {
        return "<Time>" +
                formatTimestamp(timestamp) +
                "</Time>";
    }

    private static String printTcxLatitude(TrackPoint trackPoint) {
        return "<LatitudeDegrees>" +
                trackPoint.getLatitudeString() +
                "</LatitudeDegrees>";
    }

    private static String printTcxLongitude(TrackPoint trackPoint) {
        return "<LongitudeDegrees>" +
                trackPoint.getLongitudeString() +
                "</LongitudeDegrees>";
    }

    private static String printTcxPosition(TrackPoint trackPoint) {
        if (trackPoint.latitude != null && trackPoint.longitude != null) {
            return "<Position>" +
                    printTcxLatitude(trackPoint) +
                    printTcxLongitude(trackPoint) +
                    "</Position>";
        } else return "";
    }

    private static String printTcxAltitude(TrackPoint trackPoint) {
        if (trackPoint.altitude != null) {
            return "<AltitudeMeters>" +
                    trackPoint.getAltitudeString() +
                    "</AltitudeMeters>";
        } else return "";
    }

    private static String printTcxHeartRate(Integer heartRate) {
        if (heartRate != null) {
            return "<HeartRateBpm>" +
                    "<Value>" +
                    heartRate +
                    "</Value>" +
                    "</HeartRateBpm>";
        } else return "";
    }

    private static String printTcxCadence(Integer cadence) {
        if (cadence != null) {
            return "<Cadence>" +
                    cadence +
                    "</Cadence>";
        } else return "";
    }

    private static String printTcxTrackPoint(TrackPoint trackPoint) {
        return "<Trackpoint>" +
                printTcxTime(trackPoint.timestamp) +
                printTcxPosition(trackPoint) +
                printTcxAltitude(trackPoint) +
                printTcxHeartRate(trackPoint.heartRate) +
                printTcxCadence(trackPoint.cadence) +
                "</Trackpoint>" +
                "\r\n";
    }

    private static String printTcxPoints(Track track) {
        StringBuilder stringBuilder = new StringBuilder();
        for (TrackPoint trackPoint : track.trackPoints) {
            stringBuilder.append(printTcxTrackPoint(trackPoint));
        }
        return stringBuilder.toString();
    }

    static String printGpx(Track track) {
        return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
                "<gpx version=\"1.1\" creator=\"Endomondo.com\"\n" +
                "    xsi:schemaLocation=\"http://www.topografix.com/GPX/1/1\n" +
                "    http://www.topografix.com/GPX/1/1/gpx.xsd\n" +
                "    http://www.garmin.com/xmlschemas/GpxExtensions/v3\n" +
                "    http://www.garmin.com/xmlschemas/GpxExtensionsv3.xsd\n" +
                "    http://www.garmin.com/xmlschemas/TrackPointExtension/v1\n" +
                "    http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd\"\n" +
                "    xmlns=\"http://www.topografix.com/GPX/1/1\"\n" +
                "    xmlns:gpxtpx=\"http://www.garmin.com/xmlschemas/TrackPointExtension/v1\"\n" +
                "    xmlns:gpxx=\"http://www.garmin.com/xmlschemas/GpxExtensions/v3\"\n" +
                "    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">" +
                "    <metadata>\n" +
                "        <time>" + formatTimestamp(track.startTime) + " </time>\n" +
                "    </metadata>" +
                "<trk>" + "\n" +
                "<type>" + track.getActivityTypeDescription() + "</type>" +
                "<trkseg>" + "\n" +
                printGpxPoints(track) +
                "</trkseg>" + "\n" +
                "</trk>" + "\n" +
                "</gpx>";
    }

    private static String printGpxPoints(Track track) {
        StringBuilder stringBuilder = new StringBuilder();
        for (TrackPoint trackPoint : track.trackPoints) {
            stringBuilder.append(printGpxTrackPoint(trackPoint));
        }
        return stringBuilder.toString();
    }

    private static String printGpxTrackPoint(TrackPoint trackPoint) {
        // some programs doesn't expect to find trackpoint without coordinates
        if (trackPoint.latitude != null && trackPoint.longitude != null) {
            return "<trkpt" + printGpxLatitude(trackPoint) + printGpxLongitude(trackPoint) + ">" +
                    printGpxElevation(trackPoint) +
                    printGpxTime(trackPoint.timestamp) +
                    printGpxExtension(trackPoint) +
                    "</trkpt>" +
                    "\r\n";
        } else return "";
    }

    private static String printGpxLatitude(TrackPoint trackPoint) {
        if (trackPoint.latitude != null) {
            return " lat=\"" + trackPoint.getLatitudeString() + "\"";
        } else return "";
    }

    private static String printGpxLongitude(TrackPoint trackPoint) {
        if (trackPoint.longitude != null) {
            return " lon=\"" + trackPoint.getLongitudeString() + "\"";
        } else return "";
    }

    private static String printGpxElevation(TrackPoint trackPoint) {
        if (trackPoint.altitude != null) {
            return "<ele>" + trackPoint.getAltitudeString() + "</ele>";
        } else return "";
    }

    private static String printGpxTime(Long timestamp) {
        return "<time>" + formatTimestamp(timestamp) + "</time>";
    }

    private static String printGpxExtension(TrackPoint trackPoint) {
        String result = "";
        if (trackPoint.heartRate != null || trackPoint.cadence != null) {
            result = "<extensions>" +
                    "<gpxtpx:TrackPointExtension>" +
                    printGpxHeartRate(trackPoint) +
                    printGpxCadence(trackPoint) +
                    "</gpxtpx:TrackPointExtension>" +
                    "</extensions>";
        }
        return result;
    }

    private static String printGpxHeartRate(TrackPoint trackPoint) {
        if (trackPoint.heartRate != null) {
            return "<gpxtpx:hr>" + trackPoint.heartRate + "</gpxtpx:hr>";
        } else return "";
    }

    private static String printGpxCadence(TrackPoint trackPoint) {
        if (trackPoint.cadence != null) {
            return "<gpxtpx:cad>" + trackPoint.cadence +"</gpxtpx:cad>";
        } else return "";
    }
}
