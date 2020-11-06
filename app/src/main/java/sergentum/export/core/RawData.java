package sergentum.export.core;

import sergentum.export.Starter;
import java.util.ArrayList;
import java.util.Locale;

import static sergentum.export.Starter.COMMA;
import static sergentum.export.Starter.CSV_COLUMN_DELIMITER;
import static sergentum.export.Starter.EMPTY_VALUE;
import static sergentum.export.Starter.SEMICOLON;

public class RawData {
    private Starter starter;
    private QueryData queryData;

    RawData(Starter starter, QueryData queryData) {
        this.starter = starter;
        this.queryData = queryData;
    }

    RawTrackData parseRawData() {
        RawTrackData rawTrackData = new RawTrackData();
        try {
            rawTrackData.startTime = Long.parseLong(queryData.startTime);
            rawTrackData.endTime = Long.parseLong(queryData.endTime);
            rawTrackData.costTime = Integer.parseInt(queryData.costTime);
            rawTrackData.distance = Integer.parseInt(queryData.distance);
            rawTrackData.activityType = Integer.parseInt(queryData.activityType);
            rawTrackData.avgHr = Integer.parseInt(queryData.avgHr);

            rawTrackData.times = parseTime(queryData.BULKTIME);
            rawTrackData.coordinates = parseCoordinates(queryData.BULKLL, queryData.BULKAL);

            // sometimes size is zero but actually data is exist
//            int size = (queryData.size != null && queryData.size.length() > 0) ? Integer.parseInt(queryData.size) : 0;
//            rawTrackData.size = size != 0 ? size : rawTrackData.times.size();
            rawTrackData.size = rawTrackData.costTime;

            ArrayList<Integer> HRs = parseHR(queryData.BULKHR);
            rawTrackData.hrPoints = HRs;
            System.out.println("hrPointsSize:" + HRs.size());

            rawTrackData.steps = parseSteps(queryData.BULKGAIT);
        } catch (Exception e) {
            starter.log("ex while parsing: ", e);
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
            String[] stepParts = stepAsString.split(COMMA);
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
        String[] startHr = startHrAsString.split(COMMA);
        int count = (startHr[0].length() > 0) ? Integer.parseInt(startHr[0]) : 1;
        int hrValue = Integer.parseInt(startHr[1]);
        for (int i = 0; i < count; i++) {
            hrPoints.add(hrValue);
        }

        for (int i = 1; i < BULKHR_split.length; i++) {
            String hrPointAsString = BULKHR_split[i];
            String[] hrPointAsArr = hrPointAsString.split(COMMA);
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
                times.add(time);
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
        String[] stringCoords = llString.split(COMMA);
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
    
    
    public static class QueryData {
        public String startTime ;
        public String endTime ;
        public String costTime ;
        public String size ;
        public String avgHr ;
        public String distance ;
        public String activityType ;
        public String BULKLL ;
        public String BULKGAIT ;
        public String BULKAL ;
        public String BULKTIME ;
        public String BULKHR ;
        public String BULKPACE ;
        public String BULKFLAG ;

        @Override
        public String toString() {
            return "QueryData{" +
                    "startTime='" + startTime + '\'' +
                    ", endTime='" + endTime + '\'' +
                    ", costTime='" + costTime + '\'' +
                    ", size='" + size + '\'' +
                    ", distance='" + distance + '\'' +
                    ", activityType='" + activityType + '\'' +
                    '}';
        }
    }

    public static class RawTrackData {

        // theese fields aren't bulked
        long startTime;
        long endTime;
        int distance;
        int costTime;
        int activityType;
        int size;
        int avgHr;

        // theese data is synced between each other, so it's size should be equal
        ArrayList<Integer> times = new ArrayList<>();
        ArrayList<Model.Coordinate> coordinates = new ArrayList<>();
//        ArrayList<Integer> flags = new ArrayList<>();
//        ArrayList<Integer> paces = new ArrayList<>();
//        ArrayList<Integer> speeds = new ArrayList<>();

        ArrayList<Integer> hrPoints = new ArrayList<>();

        ArrayList<Model.Step> steps = new ArrayList<>();

        public String toCsv() {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("sep=" + CSV_COLUMN_DELIMITER);
            stringBuilder.append("\r\n");
            stringBuilder.append(String.format(Locale.US, "Start: %d", startTime)).append(CSV_COLUMN_DELIMITER);
            stringBuilder.append(String.format(Locale.US, "Duration: %d", costTime)).append(CSV_COLUMN_DELIMITER);
            stringBuilder.append(String.format(Locale.US, "End: %d", endTime)).append(CSV_COLUMN_DELIMITER);
            stringBuilder.append(String.format(Locale.US, "Type: %d", activityType)).append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("\r\n");

            stringBuilder.append("Altitude").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("Latitude").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("Longitude").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("Time").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("HeartRate").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("First").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("Second").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("Cadence").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("Stride").append(CSV_COLUMN_DELIMITER);
            stringBuilder.append("\r\n");

            int rowCount;
            rowCount = Math.max(hrPoints.size(), steps.size());
            rowCount = Math.max(rowCount, coordinates.size());
            for (int i = 0; i < rowCount; i++) {
                if (i < coordinates.size()) {
                    Model.Coordinate coordinate = coordinates.get(i);
                    stringBuilder.append(coordinate.altitude).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(coordinate.latitude).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(coordinate.longitude).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(times.get(i)).append(CSV_COLUMN_DELIMITER);
                } else {
                    stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                }

                if (i < hrPoints.size()) {
                    Integer hr = hrPoints.get(i);
                    stringBuilder.append(hr).append(CSV_COLUMN_DELIMITER);
                } else {
                    stringBuilder.append(EMPTY_VALUE).append(CSV_COLUMN_DELIMITER);
                }

                if (i < steps.size()) {
                    Model.Step step = steps.get(i);
                    stringBuilder.append(step.first).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(step.second).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(step.cadence).append(CSV_COLUMN_DELIMITER);
                    stringBuilder.append(step.stride).append(CSV_COLUMN_DELIMITER);
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

        @Override
        public String toString() {
            return "RawTrackData{" +
                    "startTime=" + startTime + " ms" +
                    ", endTime=" + endTime + " ms" +
                    ", distance=" + distance + " m" +
                    ", costTime=" + costTime + " s" +
                    ", activityType=" + activityType + "" +
                    ", size=" + size + "" +
                    ", times=" + times.size() + " pts" +
                    ", coordinates=" + coordinates.size() + " pts" +
                    ", hrPoints=" + hrPoints.size() + " pts" +
                    ", steps=" + steps.size() + " pts" +
                    '}';
        }
    }

}
