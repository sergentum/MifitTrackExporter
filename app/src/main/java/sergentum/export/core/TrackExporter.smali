.class public Lsergentum/export/core/TrackExporter;
.super Ljava/lang/Object;
.source "TrackExporter.java"


# static fields
.field static final COMMA:Ljava/lang/String; = ","

.field static final CSV_COLUMN_DELIMITER:Ljava/lang/String; = ";"

.field public static final DEBUG_LOG_FILE:Ljava/lang/String; = "log.txt"

.field private static final DEBUG_OUT_PATH:Ljava/lang/String; = "debug/"

.field public static DEVICE_PATH:Ljava/lang/String; = null

.field static final EMPTY_VALUE:Ljava/lang/String; = "-"

.field private static EXPORT_PATH:Ljava/lang/String; = null

.field public static FILE_FORMAT:Ljava/lang/String; = null

.field private static final GPX_EXT:Ljava/lang/String; = ".gpx"

.field private static final RAW_CSV:Ljava/lang/String; = "-raw.csv"

.field static final SEMICOLON:Ljava/lang/String; = ";"

.field private static final TCX_EXT:Ljava/lang/String; = ".tcx"

.field public static debug:Z


# instance fields
.field private starter:Lsergentum/export/Starter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-boolean v0, Lsergentum/export/core/TrackExporter;->debug:Z

    .line 26
    const-string v0, ""

    sput-object v0, Lsergentum/export/core/TrackExporter;->DEVICE_PATH:Ljava/lang/String;

    .line 29
    const-string v0, "Android/Mifit/"

    sput-object v0, Lsergentum/export/core/TrackExporter;->EXPORT_PATH:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lsergentum/export/Starter;)V
    .registers 2
    .param p1, "starter"    # Lsergentum/export/Starter;

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    .line 40
    return-void
.end method

.method private compileDataToTrack(Lsergentum/export/core/RawData$RawTrackData;)Lsergentum/export/core/Model$Track;
    .registers 22
    .param p1, "rawTrackData"    # Lsergentum/export/core/RawData$RawTrackData;

    .prologue
    .line 116
    new-instance v14, Lsergentum/export/core/Model$Track;

    invoke-direct {v14}, Lsergentum/export/core/Model$Track;-><init>()V

    .line 117
    .local v14, "track":Lsergentum/export/core/Model$Track;
    move-object/from16 v0, p1

    iget-wide v12, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 119
    .local v12, "timestamp":J
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->size:I

    move/from16 v16, v0

    move/from16 v0, v16

    iput v0, v14, Lsergentum/export/core/Model$Track;->size:I

    .line 120
    iput-wide v12, v14, Lsergentum/export/core/Model$Track;->startTime:J

    .line 121
    move-object/from16 v0, p1

    iget-wide v0, v0, Lsergentum/export/core/RawData$RawTrackData;->endTime:J

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    iput-wide v0, v14, Lsergentum/export/core/Model$Track;->endTime:J

    .line 122
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->costTime:I

    move/from16 v16, v0

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    iput-wide v0, v14, Lsergentum/export/core/Model$Track;->duration:J

    .line 123
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->distance:I

    move/from16 v16, v0

    move/from16 v0, v16

    iput v0, v14, Lsergentum/export/core/Model$Track;->distance:I

    .line 124
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->activityType:I

    move/from16 v16, v0

    move/from16 v0, v16

    iput v0, v14, Lsergentum/export/core/Model$Track;->activityType:I

    .line 128
    move-object/from16 v0, p1

    iget-wide v12, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 129
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 130
    .local v6, "hrTrackPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$TrackPoint;>;"
    move-object/from16 v0, p1

    iget-object v5, v0, Lsergentum/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    .line 131
    .local v5, "hrPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_53
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_76

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    .line 132
    .local v4, "hrPoint":Ljava/lang/Integer;
    new-instance v15, Lsergentum/export/core/Model$TrackPoint;

    invoke-direct {v15}, Lsergentum/export/core/Model$TrackPoint;-><init>()V

    .line 133
    .local v15, "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v15, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 134
    iput-object v4, v15, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    .line 135
    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 136
    const-wide/16 v18, 0x1

    add-long v12, v12, v18

    .line 137
    goto :goto_53

    .line 139
    .end local v4    # "hrPoint":Ljava/lang/Integer;
    .end local v15    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_76
    move-object/from16 v0, p1

    iget-wide v12, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 140
    new-instance v2, Ljava/util/TreeMap;

    invoke-direct {v2}, Ljava/util/TreeMap;-><init>()V

    .line 141
    .local v2, "coordTrackPointMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_80
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->size:I

    move/from16 v16, v0

    move/from16 v0, v16

    if-ge v7, v0, :cond_11d

    .line 142
    new-instance v15, Lsergentum/export/core/Model$TrackPoint;

    invoke-direct {v15}, Lsergentum/export/core/Model$TrackPoint;-><init>()V

    .line 143
    .restart local v15    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/RawData$RawTrackData;->times:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    .line 144
    .local v8, "integer":Ljava/lang/Integer;
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v16

    if-nez v16, :cond_a9

    .line 145
    const/16 v16, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 147
    :cond_a9
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lsergentum/export/core/Model$Coordinate;

    move-object/from16 v0, v16

    iget-wide v0, v0, Lsergentum/export/core/Model$Coordinate;->altitude:J

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    iput-object v0, v15, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    .line 148
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lsergentum/export/core/Model$Coordinate;

    move-object/from16 v0, v16

    iget-wide v0, v0, Lsergentum/export/core/Model$Coordinate;->latitude:J

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    iput-object v0, v15, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    .line 149
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lsergentum/export/core/Model$Coordinate;

    move-object/from16 v0, v16

    iget-wide v0, v0, Lsergentum/export/core/Model$Coordinate;->longitude:J

    move-wide/from16 v16, v0

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    iput-object v0, v15, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    .line 150
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v16

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    add-long v12, v12, v16

    .line 151
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    iput-object v0, v15, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 152
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-interface {v2, v0, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_80

    .line 156
    .end local v8    # "integer":Ljava/lang/Integer;
    .end local v15    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_11d
    move-object/from16 v0, p1

    iget-wide v12, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 157
    new-instance v10, Ljava/util/TreeMap;

    invoke-direct {v10}, Ljava/util/TreeMap;-><init>()V

    .line 158
    .local v10, "stepTrackPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    move-object/from16 v0, p1

    iget-object v11, v0, Lsergentum/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    .line 159
    .local v11, "steps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$Step;>;"
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v16

    :goto_12e
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_174

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lsergentum/export/core/Model$Step;

    .line 160
    .local v9, "step":Lsergentum/export/core/Model$Step;
    new-instance v15, Lsergentum/export/core/Model$TrackPoint;

    invoke-direct {v15}, Lsergentum/export/core/Model$TrackPoint;-><init>()V

    .line 162
    .restart local v15    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    iget v0, v9, Lsergentum/export/core/Model$Step;->cadence:I

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v15, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 163
    iget v0, v9, Lsergentum/export/core/Model$Step;->stride:I

    move/from16 v17, v0

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v15, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    .line 164
    iget v0, v9, Lsergentum/export/core/Model$Step;->first:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v18, v0

    add-long v12, v12, v18

    .line 165
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v15, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 166
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v10, v0, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12e

    .line 169
    .end local v9    # "step":Lsergentum/export/core/Model$Step;
    .end local v15    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_174
    sget-boolean v16, Lsergentum/export/core/TrackExporter;->debug:Z

    if-eqz v16, :cond_1aa

    .line 170
    invoke-static {v6, v2, v10}, Lsergentum/export/core/Printer;->printRawPoints(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    .line 171
    .local v3, "debugPoints":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v16, v0

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/core/TrackExporter;->getDebugPath()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, p1

    iget-wide v0, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    move-wide/from16 v18, v0

    invoke-virtual/range {v17 .. v19}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, "-points.csv"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v3, v1}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 174
    .end local v3    # "debugPoints":Ljava/lang/String;
    :cond_1aa
    move-object/from16 v0, p0

    invoke-direct {v0, v6, v2, v10}, Lsergentum/export/core/TrackExporter;->joinPointArrays(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object v16

    move-object/from16 v0, v16

    iput-object v0, v14, Lsergentum/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    .line 175
    return-object v14
.end method

.method public static getDebugPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lsergentum/export/core/TrackExporter;->DEVICE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lsergentum/export/core/TrackExporter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "debug/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 7
    .param p0, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 110
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s_%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lsergentum/export/core/Model$Track;->startTime:J

    .line 111
    invoke-static {v4, v5}, Lsergentum/export/core/Model;->formatTimestampHumanReadable(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lsergentum/export/core/Model$Track;->distance:I

    .line 112
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 110
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFullPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lsergentum/export/core/TrackExporter;->DEVICE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lsergentum/export/core/TrackExporter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getShortPath()Ljava/lang/String;
    .registers 1

    .prologue
    .line 47
    sget-object v0, Lsergentum/export/core/TrackExporter;->EXPORT_PATH:Ljava/lang/String;

    return-object v0
.end method

.method private joinPointArrays(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/util/ArrayList;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lsergentum/export/core/Model$TrackPoint;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lsergentum/export/core/Model$TrackPoint;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lsergentum/export/core/Model$TrackPoint;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lsergentum/export/core/Model$TrackPoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 183
    .local p1, "hrPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$TrackPoint;>;"
    .local p2, "coordPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    .local p3, "stepPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    sget-boolean v10, Lsergentum/export/core/TrackExporter;->debug:Z

    if-eqz v10, :cond_26

    .line 184
    iget-object v10, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Coord points map before join:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->size()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 186
    :cond_26
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 188
    .local v6, "resultPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$TrackPoint;>;"
    const/4 v5, 0x0

    .line 189
    .local v5, "lastHrPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_30
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7d

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsergentum/export/core/Model$TrackPoint;

    .line 190
    .local v4, "hrPoint":Lsergentum/export/core/Model$TrackPoint;
    iget-object v11, v4, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 191
    .local v8, "timestamp":J
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsergentum/export/core/Model$TrackPoint;

    .line 192
    .local v2, "coordPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v4, v2}, Lsergentum/export/core/TrackExporter;->joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V

    .line 193
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->size()I

    move-result v11

    if-lez v11, :cond_78

    .line 196
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lsergentum/export/core/Model$TrackPoint;

    .line 197
    .local v7, "stepPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v4, v7}, Lsergentum/export/core/TrackExporter;->joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V

    .line 198
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .end local v7    # "stepPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_78
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    move-object v5, v4

    .line 202
    goto :goto_30

    .line 204
    .end local v2    # "coordPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v4    # "hrPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v8    # "timestamp":J
    :cond_7d
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_85
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_b7

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 205
    .local v3, "coordTrackPointEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 206
    .restart local v8    # "timestamp":J
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsergentum/export/core/Model$TrackPoint;

    .line 207
    .restart local v2    # "coordPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lsergentum/export/core/Model$TrackPoint;

    .line 208
    .restart local v7    # "stepPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v2, v7}, Lsergentum/export/core/TrackExporter;->joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V

    .line 209
    invoke-static {v2, v5}, Lsergentum/export/core/TrackExporter;->joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V

    .line 210
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_85

    .line 212
    .end local v2    # "coordPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v3    # "coordTrackPointEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    .end local v7    # "stepPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v8    # "timestamp":J
    :cond_b7
    return-object v6
.end method

.method private static joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V
    .registers 3
    .param p0, "p1"    # Lsergentum/export/core/Model$TrackPoint;
    .param p1, "p2"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 216
    if-eqz p1, :cond_32

    .line 217
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    if-eqz v0, :cond_33

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    :goto_8
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    .line 218
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    if-eqz v0, :cond_36

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    :goto_10
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    .line 219
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    if-eqz v0, :cond_39

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    :goto_18
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    .line 220
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    if-eqz v0, :cond_3c

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    :goto_20
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    .line 221
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    if-eqz v0, :cond_3f

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    :goto_28
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 222
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    if-eqz v0, :cond_42

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    :goto_30
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    .line 224
    :cond_32
    return-void

    .line 217
    :cond_33
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    goto :goto_8

    .line 218
    :cond_36
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    goto :goto_10

    .line 219
    :cond_39
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    goto :goto_18

    .line 220
    :cond_3c
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    goto :goto_20

    .line 221
    :cond_3f
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    goto :goto_28

    .line 222
    :cond_42
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    goto :goto_30
.end method


# virtual methods
.method public launchExport(Ljava/util/ArrayList;)V
    .registers 27
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lsergentum/export/core/RawData$QueryData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "rawTrackDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/RawData$QueryData;>;"
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v20

    :goto_4
    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_2ea

    invoke-interface/range {v20 .. v20}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lsergentum/export/core/RawData$QueryData;

    .line 56
    .local v8, "queryData":Lsergentum/export/core/RawData$QueryData;
    new-instance v9, Lsergentum/export/core/RawData;

    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-direct {v9, v0, v8}, Lsergentum/export/core/RawData;-><init>(Lsergentum/export/Starter;Lsergentum/export/core/RawData$QueryData;)V

    .line 57
    .local v9, "rawData":Lsergentum/export/core/RawData;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 60
    .local v12, "start":J
    const-string v7, ""

    .line 62
    .local v7, "message":Ljava/lang/String;
    invoke-virtual {v9}, Lsergentum/export/core/RawData;->parseRawData()Lsergentum/export/core/RawData$RawTrackData;

    move-result-object v10

    .line 63
    .local v10, "rawTrackData":Lsergentum/export/core/RawData$RawTrackData;
    sget-boolean v19, Lsergentum/export/core/TrackExporter;->debug:Z

    if-eqz v19, :cond_99

    .line 64
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/core/TrackExporter;->getDebugPath()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget-wide v0, v10, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    move-wide/from16 v22, v0

    move-object/from16 v0, v19

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, "-raw.csv"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 65
    .local v5, "filePath":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    invoke-virtual {v10}, Lsergentum/export/core/RawData$RawTrackData;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v5}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 66
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, " saved "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 67
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-object v7, v21, v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 70
    .end local v5    # "filePath":Ljava/lang/String;
    :cond_99
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lsergentum/export/core/TrackExporter;->compileDataToTrack(Lsergentum/export/core/RawData$RawTrackData;)Lsergentum/export/core/Model$Track;

    move-result-object v18

    .line 71
    .local v18, "track":Lsergentum/export/core/Model$Track;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "FileFormat: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    sget-object v24, Lsergentum/export/core/TrackExporter;->FILE_FORMAT:Ljava/lang/String;

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v21, v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 72
    sget-object v21, Lsergentum/export/core/TrackExporter;->FILE_FORMAT:Ljava/lang/String;

    const/16 v19, -0x1

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->hashCode()I

    move-result v22

    sparse-switch v22, :sswitch_data_2ec

    :cond_d8
    :goto_d8
    packed-switch v19, :pswitch_data_2f6

    .line 88
    invoke-static/range {v18 .. v18}, Lsergentum/export/core/Printer;->printTcx(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v16

    .line 89
    .local v16, "tcx":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static/range {v18 .. v18}, Lsergentum/export/core/TrackExporter;->getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ".tcx"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 90
    .local v17, "tcxFileName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 91
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {v18 .. v18}, Lsergentum/export/core/TrackExporter;->getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ".tcx"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 93
    invoke-static/range {v18 .. v18}, Lsergentum/export/core/Printer;->printGpx(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v6

    .line 94
    .local v6, "gpx":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static/range {v18 .. v18}, Lsergentum/export/core/TrackExporter;->getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ".gpx"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 95
    .local v4, "fileName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v6, v4}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 96
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, "\n"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static/range {v18 .. v18}, Lsergentum/export/core/TrackExporter;->getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ".gpx"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 101
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v6    # "gpx":Ljava/lang/String;
    .end local v16    # "tcx":Ljava/lang/String;
    .end local v17    # "tcxFileName":Ljava/lang/String;
    :goto_1a1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 102
    .local v14, "stop":J
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, "\n saved to \""

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static {}, Lsergentum/export/core/TrackExporter;->getShortPath()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, "\" in "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    sub-long v22, v14, v12

    move-object/from16 v0, v19

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, " ms "

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 104
    .local v11, "successMessage":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    const/16 v21, 0x1

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v21, v0

    const/16 v22, 0x0

    aput-object v11, v21, v22

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 105
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    const/16 v21, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v0, v11, v1}, Lsergentum/export/Starter;->showToast(Ljava/lang/String;I)V

    goto/16 :goto_4

    .line 72
    .end local v11    # "successMessage":Ljava/lang/String;
    .end local v14    # "stop":J
    :sswitch_212
    const-string v22, ".tcx"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d8

    const/16 v19, 0x0

    goto/16 :goto_d8

    :sswitch_21e
    const-string v22, ".gpx"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v21

    if-eqz v21, :cond_d8

    const/16 v19, 0x1

    goto/16 :goto_d8

    .line 74
    :pswitch_22a
    invoke-static/range {v18 .. v18}, Lsergentum/export/core/Printer;->printTcx(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v16

    .line 75
    .restart local v16    # "tcx":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static/range {v18 .. v18}, Lsergentum/export/core/TrackExporter;->getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ".tcx"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 76
    .restart local v17    # "tcxFileName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    move-object/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 77
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static/range {v18 .. v18}, Lsergentum/export/core/TrackExporter;->getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ".tcx"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 78
    goto/16 :goto_1a1

    .line 81
    .end local v16    # "tcx":Ljava/lang/String;
    .end local v17    # "tcxFileName":Ljava/lang/String;
    :pswitch_28f
    invoke-static/range {v18 .. v18}, Lsergentum/export/core/Printer;->printGpx(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v6

    .line 82
    .restart local v6    # "gpx":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-static/range {v18 .. v18}, Lsergentum/export/core/TrackExporter;->getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ".gpx"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 83
    .restart local v4    # "fileName":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v6, v4}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 84
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {v18 .. v18}, Lsergentum/export/core/TrackExporter;->getFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v21, ".gpx"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 85
    goto/16 :goto_1a1

    .line 107
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v6    # "gpx":Ljava/lang/String;
    .end local v7    # "message":Ljava/lang/String;
    .end local v8    # "queryData":Lsergentum/export/core/RawData$QueryData;
    .end local v9    # "rawData":Lsergentum/export/core/RawData;
    .end local v10    # "rawTrackData":Lsergentum/export/core/RawData$RawTrackData;
    .end local v12    # "start":J
    .end local v18    # "track":Lsergentum/export/core/Model$Track;
    :cond_2ea
    return-void

    .line 72
    nop

    :sswitch_data_2ec
    .sparse-switch
        0x1679c1 -> :sswitch_21e
        0x16a8fb -> :sswitch_212
    .end sparse-switch

    :pswitch_data_2f6
    .packed-switch 0x0
        :pswitch_22a
        :pswitch_28f
    .end packed-switch
.end method
