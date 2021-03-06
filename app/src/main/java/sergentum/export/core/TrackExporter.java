package sergentum.export.core;

import android.annotation.SuppressLint;
import sergentum.export.Starter;
import sergentum.export.core.Model.ActivityType;
import sergentum.export.core.Model.Track;
import sergentum.export.core.Model.TrackPoint;
import sergentum.export.core.Model.TrackSummary;
import sergentum.export.core.RawData.QueryData;
import sergentum.export.core.RawData.RawTrackData;

import java.util.*;

import static sergentum.export.Starter.*;
import static sergentum.export.core.Model.ActivityType.*;
import static sergentum.export.core.Model.formatTimestampHumanReadable;


public class TrackExporter {

    // todo add settings


    private Starter starter;

    @SuppressLint("UseSparseArrays")
    public static HashMap<Integer, ActivityType> mi2sport = new HashMap<>();
    static {
        mi2sport.put(0, RUNNING);
        //actually running is only 1, other used as default
        mi2sport.put(1, RUNNING);
        mi2sport.put(2, RUNNING);
        mi2sport.put(3, RUNNING);
        mi2sport.put(4, RUNNING);
        mi2sport.put(5, RUNNING);
        mi2sport.put(6, WALKING);
        mi2sport.put(7, RUNNING);
        mi2sport.put(8, TREADMILL);
        mi2sport.put(9, CYCLING);
        mi2sport.put(15, OPEN_WATER);
    }

    public TrackExporter(Starter starter) {
        this.starter = starter;
    }

    public Track compileTrack(QueryData queryData) {
        RawData rawData = new RawData(starter, queryData);
        RawTrackData rawTrackData = rawData.parseRawData();

        if (starter.getDebug()) {
            starter.log("Will try to write raw data to file.");
            String filename = formatTimestampHumanReadable(rawTrackData.startTime) + RAW_CSV;
            String fullPath = getDebugPath() + filename;
            boolean b = starter.writeStringToFile(rawTrackData.toCsv(), fullPath);
            if (b) {
                starter.log(fullPath + " saved");
            } else {
                starter.log(fullPath + " can't save");
            }
        }

        return compileDataToTrack(rawTrackData);
    }


    private Track compileDataToTrack(RawTrackData rawTrackData) {
        starter.log("Received:" + rawTrackData);
        Track track = new Track();
        TrackSummary trackSummary = new TrackSummary();
        long timestamp = rawTrackData.startTime;

        trackSummary.activityType = mi2sport.get(rawTrackData.activityType);
        trackSummary.id = timestamp;
        trackSummary.startTime = rawTrackData.startTime;
        trackSummary.endTime = rawTrackData.endTime;
        trackSummary.duration = rawTrackData.costTime;
        trackSummary.distance = rawTrackData.distance;
        trackSummary.size = rawTrackData.costTime;
        trackSummary.avgRr = rawTrackData.avgHr;
        track.summary = trackSummary;

        // HR points is a base for track export
        // additional info will be added to hr points
        timestamp = rawTrackData.startTime;
        ArrayList<TrackPoint> hrTrackPoints = new ArrayList<>();
        ArrayList<Integer> hrPoints = rawTrackData.hrPoints;
        for (Integer hrPoint : hrPoints) {
            TrackPoint trackPoint = new TrackPoint();
            trackPoint.timestamp = timestamp;
            trackPoint.heartRate = hrPoint;
            hrTrackPoints.add(trackPoint);
            timestamp += 1;
        }

        timestamp = rawTrackData.startTime;
        Map<Long, TrackPoint> coordTrackPointMap = new TreeMap<>();
        for (int i = 0; i < rawTrackData.times.size(); i++) {
            TrackPoint trackPoint = new TrackPoint();
            Integer integer = rawTrackData.times.get(i);
            for (int j = 0; j < integer; j++) {
                trackPoint.altitude = rawTrackData.coordinates.get(i).altitude;
                trackPoint.latitude = rawTrackData.coordinates.get(i).latitude;
                trackPoint.longitude = rawTrackData.coordinates.get(i).longitude;
                timestamp += 1;
                trackPoint.timestamp = timestamp;
                coordTrackPointMap.put(timestamp, trackPoint);
            }
        }

        timestamp = rawTrackData.startTime;
        Map<Long, TrackPoint> stepTrackPointsMap = new TreeMap<>();
        ArrayList<Model.Step> steps = rawTrackData.steps;
        for (Model.Step step : steps) {
            TrackPoint trackPoint = new TrackPoint();

            trackPoint.cadence = step.cadence;
            trackPoint.stride = step.stride;
            timestamp = timestamp + step.first;
            trackPoint.timestamp = timestamp;
            stepTrackPointsMap.put(timestamp, trackPoint);
        }

        if (starter.getDebug()) {
            String debugPoints = Printer.printRawPoints(hrTrackPoints, coordTrackPointMap, stepTrackPointsMap);
            String filename = formatTimestampHumanReadable(rawTrackData.startTime) + "-points.csv";
            String fullPath = getDebugPath() + filename;
            starter.writeStringToFile(debugPoints, fullPath);
        }

        track.trackPoints = joinPointArrays(hrTrackPoints, coordTrackPointMap, stepTrackPointsMap);
        if (rawTrackData.coordinates != null && rawTrackData.coordinates.size() > 1) {
            cleanCoordPoints(track.trackPoints);
        }

        return track;
    }

    private void cleanCoordPoints(ArrayList<TrackPoint> trackPoints) {
        starter.log("Fixing incorrect altitude");
        Long lastAltitude = null;
        for (TrackPoint trackPoint : trackPoints) {
            if (trackPoint.altitude != null && trackPoint.altitude.equals(-2000000L)) {
                if (lastAltitude == null) {
                    trackPoint.altitude = 0L;
                } else {
                    trackPoint.altitude = lastAltitude;
                }
            } else {
                lastAltitude = trackPoint.altitude;
            }
        }

        // that means track contains coordinates, so points without coordinates should be removed
        // otherwise gpx would be incorrect for some services
        starter.log("Removing points without coordinates");
        if (trackPoints.size() > 1) {
            for (Iterator<TrackPoint> iterator = trackPoints.iterator(); iterator.hasNext(); ) {
                TrackPoint trackPoint = iterator.next();
                if (trackPoint.latitude == null || trackPoint.longitude == null) {
                    iterator.remove();
                }
            }
        }
    }

    private ArrayList<TrackPoint> joinPointArrays(
            ArrayList<TrackPoint> hrPoints,
            Map<Long, TrackPoint> coordPointsMap,
            Map<Long, TrackPoint> stepPointsMap
    ) {

        starter.log("Coord points map before join:" + coordPointsMap.size());

        ArrayList<TrackPoint> resultPoints = new ArrayList<>();
        long timestamp;
        TrackPoint lastHrPoint = null;
        for (TrackPoint hrPoint : hrPoints) {
            timestamp = hrPoint.timestamp;
            TrackPoint coordPoint = coordPointsMap.get(timestamp);
            joinPoints(hrPoint, coordPoint);
            coordPointsMap.remove(timestamp);

            if (stepPointsMap.size() > 0) {
                TrackPoint stepPoint = stepPointsMap.get(timestamp);
                joinPoints(hrPoint, stepPoint);
                stepPointsMap.remove(timestamp);
            }
            resultPoints.add(hrPoint);
            lastHrPoint = hrPoint;
        }

        for (Map.Entry<Long, TrackPoint> coordTrackPointEntry : coordPointsMap.entrySet()) {
            timestamp = coordTrackPointEntry.getKey();
            TrackPoint coordPoint = coordTrackPointEntry.getValue();
            TrackPoint stepPoint = stepPointsMap.get(timestamp);
            joinPoints(coordPoint, stepPoint);
            joinPoints(coordPoint, lastHrPoint);
            resultPoints.add(coordPoint);
        }
        starter.log("Coord points map after join:" + resultPoints.size());
        return resultPoints;
    }

    private static void joinPoints(TrackPoint p1, TrackPoint p2) {
        if (p2 != null) {
            p1.latitude = p2.latitude != null ? p2.latitude : p1.latitude;
            p1.longitude = p2.longitude != null ? p2.longitude : p1.longitude;
            p1.altitude = p2.altitude != null ? p2.altitude : p1.altitude;
            p1.pace = p2.pace != null ? p2.pace : p1.pace;
            p1.cadence = p2.cadence != null ? p2.cadence : p1.cadence;
            p1.stride = p2.stride != null ? p2.stride : p1.stride;
        }
    }
}
