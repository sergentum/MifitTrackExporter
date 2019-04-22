package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core;

import cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.Starter;
import java.util.ArrayList;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.core.TrackExporter.SEMICOLON;

class RawDataParser {
    private Starter starter;

    public RawDataParser(Starter starter) {
        this.starter = starter;
    }

    RawTrackData parseRawData(RawQueryData rawQueryData) {
        RawTrackData rawTrackData = new RawTrackData();
        try {
            rawTrackData.startTime = Long.parseLong(rawQueryData.startTime);
            rawTrackData.endTime = Long.parseLong(rawQueryData.endTime);
            rawTrackData.costTime = Integer.parseInt(rawQueryData.costTime);
            rawTrackData.distance = Integer.parseInt(rawQueryData.distance);
            rawTrackData.activityType = Integer.parseInt(rawQueryData.activityType);

            rawTrackData.times = parseTime(rawQueryData.BULKTIME);
            rawTrackData.coordinates = parseCoordinates(rawQueryData.BULKLL, rawQueryData.BULKAL);

            // sometimes size is zero but actually data is exist
            int size = (rawQueryData.size != null && rawQueryData.size.length() > 0) ? Integer.parseInt(rawQueryData.size) : 0;
            rawTrackData.size = size != 0 ? size : rawTrackData.times.size();

            ArrayList<Integer> HRs = parseHR(rawQueryData.BULKHR);
            rawTrackData.hrPoints = HRs;
            System.out.println("hrPointsSize:" + HRs.size());

            rawTrackData.steps = parseSteps(rawQueryData.BULKGAIT);
        } catch (Exception e) {
            starter.log("ex while parsing: " + e.getMessage());
        }
        return rawTrackData;
    }

    private ArrayList<Model.Step> parseSteps(String BULKGAIT) {
        ArrayList<Model.Step> steps = new ArrayList<>();
        if (BULKGAIT == null || BULKGAIT.length() < 1) {
            return steps;
        }
        String[] BULKGAIT_split = BULKGAIT.split(SEMICOLON);
        for (String stepString : BULKGAIT_split) {
            Model.Step step = parseStep(stepString);
            if (step != null) {
                steps.add(step);
            }
        }
        return steps;
    }

    private Model.Step parseStep(String stepAsString) {
        if (stepAsString.length() > 3) {
            String[] stepParts = stepAsString.split(TrackExporter.COMMA);
            int first = Integer.parseInt(stepParts[0]);
            int second = Integer.parseInt(stepParts[1]);
            int stride = Integer.parseInt(stepParts[2]);
            int cadence = Integer.parseInt(stepParts[3]);
            return new Model.Step(first, second, stride, cadence);
        } else {
            return null;
        }
    }

    private ArrayList<Integer> parseHR(String BULKHR) {
        String[] BULKHR_split = BULKHR.split(SEMICOLON);
        if (BULKHR_split.length < 1) {
            return new ArrayList<>();
        }
        ArrayList<Integer> hrPoints = new ArrayList<>();
        String startHrAsString = BULKHR_split[0];
        String[] startHr = startHrAsString.split(TrackExporter.COMMA);
        int count = (startHr[0].length() > 0) ? Integer.parseInt(startHr[0]) : 1;
        int hrValue = Integer.parseInt(startHr[1]);
        for (int i = 0; i < count; i++) {
            hrPoints.add(hrValue);
        }

        for (int i = 1; i < BULKHR_split.length; i++) {
            String hrPointAsString = BULKHR_split[i];
            String[] hrPointAsArr = hrPointAsString.split(TrackExporter.COMMA);
            int hrIncrement = Integer.parseInt(hrPointAsArr[1]);

            hrValue += hrIncrement;
            count = Integer.parseInt(hrPointAsArr[0]);
            for (int j = 0; j < count; j++) {
                hrPoints.add(hrValue);
            }
        }
        return hrPoints;
    }

    private ArrayList<Integer> parseTime(String BULKTIME) {
        ArrayList<Integer> times = new ArrayList<>();
        if (BULKTIME.length() > 1) {
            String[] BULKTIME_split = BULKTIME.split(SEMICOLON);
            int firstNumber = 0;
            for (int index = 0; index < BULKTIME_split.length; index++) {
                String timeString = BULKTIME_split[index];
                int time = (timeString != null && timeString.length() > 0) ? Integer.parseInt(timeString) : 0;

                // first number somewhy contains a big number, 20 for example and 20 next numbers will be zero.
                // don't know what's the point but coordinates are correct
                if (index == 0) {
                    firstNumber = time;
                }

                if (firstNumber > 0) {
                    times.add(1);
                    firstNumber--;
                } else {
                    times.add(time);
                }
            }
        }
        return times;
    }

    private ArrayList<Model.Coordinate> parseCoordinates(String BULKLL, String BULKAL) {
        String[] BULKLL_stringArr = BULKLL.split(SEMICOLON);
        String[] BULKAL_split = BULKAL.split(SEMICOLON);

        ArrayList<Model.Coordinate> coordinates = new ArrayList<>();
        if (BULKLL_stringArr.length > 1) {
            Model.Coordinate coordinate = parseCoordinate(BULKLL_stringArr[0], BULKAL_split[0], null);
            coordinates.add(coordinate);
            for (int i = 1; i < BULKLL_stringArr.length; i++) {
                Model.Coordinate currentCoordinate = parseCoordinate(BULKLL_stringArr[i], BULKAL_split[i], coordinate);
                coordinates.add(currentCoordinate);
                // here we save base for the next iteration
                coordinate = currentCoordinate;
            }

        }
        return coordinates;
    }

    private Model.Coordinate parseCoordinate(String llString, String alString, Model.Coordinate prevCoord) {
        // it can't be shorter that "0,0"
        if (llString.length() < 3) {
            return null;
        }
        String[] stringCoords = llString.split(TrackExporter.COMMA);
        if (stringCoords.length > 1) {
            long currentLat = Long.parseLong(stringCoords[0]);
            long currentLon = Long.parseLong(stringCoords[1]);
            long currentAlt = Long.parseLong(alString);
            if (prevCoord == null) {
                // that's the first point, used as base
                return new Model.Coordinate(currentLat, currentLon, currentAlt);
            } else {
                // that means we have prev coords and we know only changes, instead of actual coordinates
                currentLat += prevCoord.latitude;
                currentLon += prevCoord.longitude;
                return new Model.Coordinate(currentLat, currentLon, currentAlt);
            }
        } else {
            return null;
        }
    }
}
