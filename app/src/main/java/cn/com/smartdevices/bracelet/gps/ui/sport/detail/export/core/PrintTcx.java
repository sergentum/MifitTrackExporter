package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

public class PrintTcx {
    private Track track;

    public PrintTcx(Track track) {
        this.track = track;
    }

    public String print() {
        return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" + "\n" +
                "<TrainingCenterDatabase " + "\n" +
                "xsi:schemaLocation=\"" +
                "http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 " +
                "http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd\" " + "\n" +
                "xmlns:ns5=\"http://www.garmin.com/xmlschemas/ActivityGoals/v1\" " + "\n" +
                "xmlns:ns3=\"http://www.garmin.com/xmlschemas/ActivityExtension/v2\" " + "\n" +
                "xmlns:ns2=\"http://www.garmin.com/xmlschemas/UserProfile/v2\" " + "\n" +
                "xmlns=\"http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2\" " + "\n" +
                "xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">" + "\n" +
                "<Activities>" + "\n" +
                "<Activity Sport=\"" + track.getActivityTypeDescription() + "\">" + "\n" +
                "<Id>" + TrackPoint.formatTimestamp(track.startTime) + "</Id>" + "\n" +
                "<Lap StartTime=\"" + track.getStartTimeAsDate() + "\">" + "\n" +
                "<TotalTimeSeconds>" + (track.endTime - track.startTime) + "</TotalTimeSeconds>" + "\n" +
                "<DistanceMeters>" + track.distance + "</DistanceMeters>" + "\n" +
                "<Track>" + "\n" +
                printTcxPoints() +
                "</Track>" + "\n" +
                "</Lap>" + "\n" +
                "</Activity>" + "\n" +
                "</Activities>" + "\n" +
                "</TrainingCenterDatabase>";
    }

    private String printTcxTime(Long timestamp) {
        return "<Time>" +
                TrackPoint.formatTimestamp(timestamp) +
                "</Time>";
    }

    private String printTcxLatitude(TrackPoint trackPoint) {
        return "<LatitudeDegrees>" +
                trackPoint.getLatitudeString() +
                "</LatitudeDegrees>";
    }

    private String printTcxLongitude(TrackPoint trackPoint) {
        return "<LongitudeDegrees>" +
                trackPoint.getLongitudeString() +
                "</LongitudeDegrees>";
    }

    private String printTcxPosition(TrackPoint trackPoint) {
        if (trackPoint.latitude != null && trackPoint.longitude != null) {
            return "<Position>" +
                    printTcxLatitude(trackPoint) +
                    printTcxLongitude(trackPoint) +
                    "</Position>";
        } else return "";
    }

    private String printTcxAltitude(TrackPoint trackPoint) {
        if (trackPoint.altitude != null) {
            return "<AltitudeMeters>" +
                    trackPoint.getAltitudeString() +
                    "</AltitudeMeters>";
        } else return "";
    }

    private String printTcxHeartRate(Integer heartRate) {
        if (heartRate != null) {
            return "<HeartRateBpm>" +
                    "<Value>" +
                    heartRate +
                    "</Value>" +
                    "</HeartRateBpm>";
        } else return "";
    }

    private String printTcxCadence(Integer cadence) {
        if (cadence != null) {
            return "<Cadence>" +
                    cadence +
                    "</Cadence>";
        } else return "";
    }

    private String printTcxTrackPoint(TrackPoint trackPoint) {
        return "<Trackpoint>" +
                printTcxTime(trackPoint.timestamp) +
                printTcxPosition(trackPoint) +
                printTcxAltitude(trackPoint) +
                printTcxHeartRate(trackPoint.heartRate) +
                printTcxCadence(trackPoint.cadence) +
                "</Trackpoint>" +
                "\r\n";
    }

    private String printTcxPoints() {
        StringBuilder stringBuilder = new StringBuilder();
        for (TrackPoint trackPoint : track.trackPoints) {
            stringBuilder.append(printTcxTrackPoint(trackPoint));
        }
        return stringBuilder.toString();
    }
}
