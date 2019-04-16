package cn.com.smartdevices.bracelet.gps.ui.sport.detail.export;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import static cn.com.smartdevices.bracelet.gps.ui.sport.detail.export.ExportTrack.SEMICOLON;

public class TrackDataParser {

    public static RawTrackData parseRawData(ResultSet resultSet, ResultSetMetaData rsmd) {
        RawTrackData rawTrackData = new RawTrackData();
        long startTime = 0;
        long endTime = 0;
        int costTime = 0;
        int size = 0;
        int distance = 0;
        int activityType = 0;
        String BULKLL = "";
        String BULKGAIT = "";
        String BULKAL = "";
        String BULKTIME = "";
        String BULKHR = "";
        String BULKPACE = "";
        String BULKFLAG = "";
        try {
            for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                String columnName = rsmd.getColumnName(i);
                System.out.print(i + " " + columnName + " ");
                String columnValue = resultSet.getString(i);
                if (columnName.contains("BULK")) {
                    if (columnValue != null) {
                        String[] BULK_split = columnValue.split(SEMICOLON);
                        System.out.print(BULK_split.length);
                    }
                } else {
                    System.out.print("-" + columnValue + "-");
                }
                System.out.println("");

                if (columnValue != null) {
                    if (columnName.equalsIgnoreCase("TRACKID")) {
                        startTime = Long.parseLong(columnValue);
                    } else if (columnName.equalsIgnoreCase("ENDTIME")) {
                        endTime = Long.parseLong(columnValue);
                    } else if (columnName.equalsIgnoreCase("COSTTIME")) {
                        costTime = Integer.parseInt(columnValue);
                    } else if (columnName.equalsIgnoreCase("SIZE")) {
                        size = Integer.parseInt(columnValue);
                    } else if (columnName.equalsIgnoreCase("TYPE")) {
                        activityType = Integer.parseInt(columnValue);
                    } else if (columnName.equalsIgnoreCase("DISTANCE")) {
                        distance = Integer.parseInt(columnValue);
                    } else if (columnName.equalsIgnoreCase("BULKLL")) {
                        BULKLL = columnValue;
                    } else if (columnName.equalsIgnoreCase("BULKGAIT")) {
                        BULKGAIT = columnValue;
                    } else if (columnName.equalsIgnoreCase("BULKAL")) {
                        BULKAL = columnValue;
                    } else if (columnName.equalsIgnoreCase("BULKTIME")) {
                        BULKTIME = columnValue;
                    } else if (columnName.equalsIgnoreCase("BULKHR")) {
                        BULKHR = columnValue.replace(";,", ";1,");
                    } else if (columnName.equalsIgnoreCase("BULKPACE")) {
                        BULKPACE = columnValue;
                    } else if (columnName.equalsIgnoreCase("BULKFLAG")) {
                        BULKFLAG = columnValue;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            // error while parsing rawData in column with value
            // TODO: 2019-04-09 log error
            // TODO: 2019-04-09 add multilog to logcat and file
        }

        System.out.println();

        rawTrackData.startTime = startTime;
        rawTrackData.endTime = endTime;
        rawTrackData.costTime = costTime;
        rawTrackData.distance = distance;
        rawTrackData.activityType = activityType;

        rawTrackData.times = parseTime(BULKTIME);
        rawTrackData.coordinates = parseCoordinates(BULKLL, BULKAL);

        // sometimes size is zero but actually data is exist
        size = size != 0 ? size : rawTrackData.times.size();
        rawTrackData.size = size;

        ArrayList<Integer> integers = parseHR(BULKHR);
        rawTrackData.hrPoints = integers;
        System.out.println("hrPointsSize:" + integers.size());

        rawTrackData.steps = parseSteps(BULKGAIT);

        return rawTrackData;
    }

    private static ArrayList<Step> parseSteps(String BULKGAIT) {
        ArrayList<Step> steps = new ArrayList<>();
        String[] BULKGAIT_split = BULKGAIT.split(SEMICOLON);
        for (String stepString : BULKGAIT_split) {
            Step step = parseStep(stepString);
            if (step != null) {
                steps.add(step);
            }
        }
        return steps;
    }

    private static Step parseStep(String stepAsString) {
        if (stepAsString.length() > 3) {
            String[] stepParts = stepAsString.split(ExportTrack.COMMA);
            int first = Integer.parseInt(stepParts[0]);
            int second = Integer.parseInt(stepParts[1]);
            int stride = Integer.parseInt(stepParts[2]);
            int cadence = Integer.parseInt(stepParts[3]);
            return new Step(first, second, stride, cadence);
        } else {
            return null;
        }
    }

    private static ArrayList<Integer> parseHR(String BULKHR) {
        String[] BULKHR_split = BULKHR.split(SEMICOLON);
        if (BULKHR_split.length < 1) {
            return new ArrayList<>();
        }
        ArrayList<Integer> hrPoints = new ArrayList<>();
        String startHrAsString = BULKHR_split[0];
        String[] startHr = startHrAsString.split(ExportTrack.COMMA);
        int count = (startHr[0].length() > 0) ? Integer.parseInt(startHr[0]) : 1;
        int hrValue = Integer.parseInt(startHr[1]);
        for (int i = 0; i < count; i++) {
            hrPoints.add(hrValue);
        }

        for (int i = 1; i < BULKHR_split.length; i++) {
            String hrPointAsString = BULKHR_split[i];
            String[] hrPointAsArr = hrPointAsString.split(ExportTrack.COMMA);
            int hrIncrement = Integer.parseInt(hrPointAsArr[1]);

            hrValue += hrIncrement;
            count = Integer.parseInt(hrPointAsArr[0]);
            for (int j = 0; j < count; j++) {
                hrPoints.add(hrValue);
            }
        }
        return hrPoints;
    }

    private static ArrayList<Integer> parseTime(String BULKTIME) {
        ArrayList<Integer> times = new ArrayList<>();
        if (BULKTIME.length() > 1) {
            String[] BULKTIME_split = BULKTIME.split(SEMICOLON);
            int secondsFromStart = 0;
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

    private static ArrayList<Coordinate> parseCoordinates(String BULKLL, String BULKAL) {
        String[] BULKLL_stringArr = BULKLL.split(SEMICOLON);
        String[] BULKAL_split = BULKAL.split(SEMICOLON);

        ArrayList<Coordinate> coordinates = new ArrayList<>();
        if (BULKLL_stringArr.length > 1) {
            Coordinate coordinate = parseCoordinate(BULKLL_stringArr[0], BULKAL_split[0], null);
            coordinates.add(coordinate);
            for (int i = 1; i < BULKLL_stringArr.length; i++) {
                Coordinate currentCoordinate = parseCoordinate(BULKLL_stringArr[i], BULKAL_split[i], coordinate);
                coordinates.add(currentCoordinate);
                // here we save base for the next iteration
                coordinate = currentCoordinate;
            }

        }
        return coordinates;
    }

    private static Coordinate parseCoordinate(String llString, String alString, Coordinate prevCoord) {
        // it can't be shorter that "0,0"
        if (llString.length() < 3) {
            return null;
        }
        String[] stringCoords = llString.split(ExportTrack.COMMA);
        if (stringCoords.length > 1) {
            long currentLat = Long.parseLong(stringCoords[0]);
            long currentLon = Long.parseLong(stringCoords[1]);
            long currentAlt = Long.parseLong(alString);
            if (prevCoord == null) {
                // that's the first point, used as base
                return new Coordinate(currentLat, currentLon, currentAlt);
            } else {
                // that means we have prev coords and we know only changes, instead of actual coordinates
                currentLat += prevCoord.latitude;
                currentLon += prevCoord.longitude;
                return new Coordinate(currentLat, currentLon, currentAlt);
            }
        } else {
            return null;
        }
    }
}
