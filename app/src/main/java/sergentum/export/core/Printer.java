package sergentum.export.core;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import sergentum.export.core.Model.Track;
import sergentum.export.core.Model.TrackPoint;

import static sergentum.export.Starter.CSV_COLUMN_DELIMITER;
import static sergentum.export.Starter.EMPTY_VALUE;
import static sergentum.export.core.Model.formatTimestamp;

public class Printer {
    static String printRawPoints(
            ArrayList<TrackPoint> hrTrackPoints,
            Map<Long, TrackPoint> coordTrackPoints,
            Map<Long, TrackPoint> stepTrackPoints
    ) {
        StringBuilder stringBuilder = new StringBuilder();

        stringBuilder.append("sep=" + CSV_COLUMN_DELIMITER);
        stringBuilder.append("\r\n");

        int csvSize = Math.max(hrTrackPoints.size(), coordTrackPoints.size());
        Iterator<Map.Entry<Long, TrackPoint>> iteratorCoords = coordTrackPoints.entrySet().iterator();
        Iterator<Map.Entry<Long, TrackPoint>> iteratorSteps = stepTrackPoints.entrySet().iterator();
        for (int i = 0; i < csvSize; i++) {

            if (i < hrTrackPoints.size()) {
                TrackPoint trackPoint = hrTrackPoints.get(i);
                stringBuilder.append(formatTimestamp(trackPoint.timestamp)).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(trackPoint.heartRate).append(CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
            }

            stringBuilder.append(" ").append(CSV_COLUMN_DELIMITER);

            if (iteratorCoords.hasNext()) {
                TrackPoint trackPoint = iteratorCoords.next().getValue();
                stringBuilder.append(trackPoint.altitude).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(trackPoint.latitude).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(trackPoint.longitude).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(formatTimestamp(trackPoint.timestamp)).append(CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
            }

            stringBuilder.append(" ").append(CSV_COLUMN_DELIMITER);

            if (iteratorSteps.hasNext()) {
                TrackPoint trackPoint = iteratorSteps.next().getValue();
                stringBuilder.append(formatTimestamp(trackPoint.timestamp)).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append("second").append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(trackPoint.cadence).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(trackPoint.stride).append(CSV_COLUMN_DELIMITER);
            } else {
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
            }
            stringBuilder.append("\r\n");
        }
        return stringBuilder.toString();
    }

    public static String printTcx(Track track) {
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
                "<Activity Sport=\"" + track.summary.getActivityTypeDescription() + "\">" + "\n" +
                "<Id>" + formatTimestamp(track.summary.startTime) + "</Id>" + "\n" +
                "<Lap StartTime=\"" + track.summary.getStartTimeAsDate() + "\">" + "\n" +
                "<TotalTimeSeconds>" + (track.summary.endTime - track.summary.startTime) + "</TotalTimeSeconds>" + "\n" +
                "<DistanceMeters>" + track.summary.distance + "</DistanceMeters>" + "\n" +
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

    public static String printGpx(Track track) {
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
                "    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n" +
                "    <metadata>\n" +
                "        <time>" + formatTimestamp(track.summary.startTime) + " </time>\n" +
                "    </metadata>" +
                "<trk>" + "\n" +
                "<type>" + track.summary.getActivityTypeDescription() + "</type>" +
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
        return "<trkpt" + printGpxLatitude(trackPoint) + printGpxLongitude(trackPoint) + ">" +
                printGpxElevation(trackPoint) +
                printGpxTime(trackPoint.timestamp) +
                printGpxExtension(trackPoint) +
                "</trkpt>" +
                "\r\n";
    }

    private static String printGpxLatitude(TrackPoint trackPoint) {
        // TODO: 2019-10-26 check that null check and remove
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

    public static String printEndomondoTrack(Track track) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss 'UTC'", Locale.US);
        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));

        StringBuilder lines = new StringBuilder();
        StringBuilder line = new StringBuilder();
        ArrayList<TrackPoint> trackPoints = track.trackPoints;
        for (int i = 0, trackPointsSize = trackPoints.size(); i < trackPointsSize; i++) {
            TrackPoint trackPoint = trackPoints.get(i);
            // # timestamp;
            // # type (2=start, 3=end, 0=pause, 1=resume);
            // # latitude;
            // # longitude;
            // #    distance; km
            // #    speed; km/h
            // # alt;
            // # hr;
            // # cadence;
            // # power;
            Date trackPointDate = new Date(trackPoint.timestamp * 1000);
            line.append(simpleDateFormat.format(trackPointDate)).append(";");
            if (i == 0) {
                line.append("2;");
            } else if (i == (trackPointsSize - 1)){
                line.append("3;");
            } else {
                line.append(";");
            }
            line.append(trackPoint.getLatitudeString()).append(";");
            line.append(trackPoint.getLongitudeString()).append(";");
            line.append(";");
            line.append(";");
            line.append(trackPoint.getAltitudeString()).append(";");
            line.append(trackPoint.getHeartRateString()).append(";");
            line.append(trackPoint.getCadenceString()).append(";\n");
//            2019-04-24 05:19:08 UTC;
//            1;
//            55.03489303;
//            82.92135985;
//            0.006360674673691392;
//            ;
//            183.55387575579368;
//            124;
//            150;
//            ;
        }

        lines.append(line).append("\n");
        return lines.toString();
    }
}
