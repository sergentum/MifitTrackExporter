.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
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

.field private static final RAW_CSV:Ljava/lang/String; = "-raw.csv"

.field static final SEMICOLON:Ljava/lang/String; = ";"

.field private static final TCX_EXT:Ljava/lang/String; = ".tcx"

.field private static debug:Z


# instance fields
.field private starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const/4 v0, 0x0

    sput-boolean v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->debug:Z

    .line 26
    const-string v0, ""

    sput-object v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->DEVICE_PATH:Ljava/lang/String;

    .line 28
    const-string v0, "Android/Mifit/"

    sput-object v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->EXPORT_PATH:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;)V
    .registers 2
    .param p1, "starter"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    .line 38
    return-void
.end method

.method private compileDataToTrack(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;)Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;
    .registers 24
    .param p1, "rawTrackData"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;

    .prologue
    .line 77
    new-instance v16, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;

    invoke-direct/range {v16 .. v16}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;-><init>()V

    .line 78
    .local v16, "track":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    .line 80
    .local v14, "timestamp":J
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->size:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, v16

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->size:I

    .line 81
    move-object/from16 v0, v16

    iput-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->startTime:J

    .line 82
    move-object/from16 v0, p1

    iget-wide v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->endTime:J

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    move-object/from16 v2, v16

    iput-wide v0, v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->endTime:J

    .line 83
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->costTime:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    move-object/from16 v2, v16

    iput-wide v0, v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->duration:J

    .line 84
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->distance:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, v16

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->distance:I

    .line 85
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->activityType:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, v16

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->activityType:I

    .line 89
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    .line 90
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .local v8, "hrTrackPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    move-object/from16 v0, p1

    iget-object v7, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    .line 92
    .local v7, "hrPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_5f
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_88

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 93
    .local v6, "hrPoint":Ljava/lang/Integer;
    new-instance v17, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;-><init>()V

    .line 94
    .local v17, "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 95
    move-object/from16 v0, v17

    iput-object v6, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    .line 96
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    const-wide/16 v20, 0x1

    add-long v14, v14, v20

    .line 98
    goto :goto_5f

    .line 100
    .end local v6    # "hrPoint":Ljava/lang/Integer;
    .end local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_88
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    .line 101
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 102
    .local v4, "coordTrackPointMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_92
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->size:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v9, v0, :cond_139

    .line 103
    new-instance v17, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;-><init>()V

    .line 104
    .restart local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->times:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    .line 105
    .local v10, "integer":Ljava/lang/Integer;
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v18

    if-nez v18, :cond_bb

    .line 106
    const/16 v18, 0x1

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 108
    :cond_bb
    move-object/from16 v0, p1

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;->altitude:J

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    .line 109
    move-object/from16 v0, p1

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;->latitude:J

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    .line 110
    move-object/from16 v0, p1

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;

    move-object/from16 v0, v18

    iget-wide v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;->longitude:J

    move-wide/from16 v18, v0

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    .line 111
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    add-long v14, v14, v18

    .line 112
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 113
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_92

    .line 117
    .end local v10    # "integer":Ljava/lang/Integer;
    .end local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_139
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    .line 118
    new-instance v12, Ljava/util/TreeMap;

    invoke-direct {v12}, Ljava/util/TreeMap;-><init>()V

    .line 119
    .local v12, "stepTrackPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    move-object/from16 v0, p1

    iget-object v13, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    .line 120
    .local v13, "steps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;>;"
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v18

    :goto_14a
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_198

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;

    .line 121
    .local v11, "step":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;
    new-instance v17, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;-><init>()V

    .line 123
    .restart local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    iget v0, v11, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->cadence:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 124
    iget v0, v11, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->stride:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    .line 125
    iget v0, v11, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->first:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v20, v0

    add-long v14, v14, v20

    .line 126
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 127
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-interface {v12, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_14a

    .line 130
    .end local v11    # "step":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;
    .end local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_198
    sget-boolean v18, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->debug:Z

    if-eqz v18, :cond_1ca

    .line 131
    invoke-static {v8, v4, v12}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printRawPoints(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    .line 132
    .local v5, "debugPoints":Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getDebugPath()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, p1

    iget-wide v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    move-wide/from16 v20, v0

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "-points.csv"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-static {v5, v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .end local v5    # "debugPoints":Ljava/lang/String;
    :cond_1ca
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v4, v12}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPointArrays(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    .line 136
    return-object v16
.end method

.method public static getDebugPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->DEVICE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "debug/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getFileName(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;
    .registers 7
    .param p0, "track"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;

    .prologue
    .line 71
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s_%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->startTime:J

    .line 72
    invoke-static {v4, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestampHumanReadable(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->distance:I

    .line 73
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 71
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFullPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->DEVICE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getShortPath()Ljava/lang/String;
    .registers 1

    .prologue
    .line 45
    sget-object v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->EXPORT_PATH:Ljava/lang/String;

    return-object v0
.end method

.method private joinPointArrays(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/util/ArrayList;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 144
    .local p1, "hrPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    .local p2, "coordPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    .local p3, "stepPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    sget-boolean v10, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->debug:Z

    if-eqz v10, :cond_26

    .line 145
    iget-object v10, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

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

    invoke-virtual {v10, v11}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 147
    :cond_26
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 149
    .local v6, "resultPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    const/4 v5, 0x0

    .line 150
    .local v5, "lastHrPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_30
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_7d

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 151
    .local v4, "hrPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    iget-object v11, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 152
    .local v8, "timestamp":J
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 153
    .local v2, "coordPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v4, v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V

    .line 154
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->size()I

    move-result v11

    if-lez v11, :cond_78

    .line 157
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 158
    .local v7, "stepPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v4, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V

    .line 159
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .end local v7    # "stepPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_78
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    move-object v5, v4

    .line 163
    goto :goto_30

    .line 165
    .end local v2    # "coordPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    .end local v4    # "hrPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
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

    .line 166
    .local v3, "coordTrackPointEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 167
    .restart local v8    # "timestamp":J
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 168
    .restart local v2    # "coordPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 169
    .restart local v7    # "stepPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v2, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V

    .line 170
    invoke-static {v2, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V

    .line 171
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_85

    .line 173
    .end local v2    # "coordPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    .end local v3    # "coordTrackPointEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    .end local v7    # "stepPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    .end local v8    # "timestamp":J
    :cond_b7
    return-object v6
.end method

.method private static joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V
    .registers 3
    .param p0, "p1"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    .param p1, "p2"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .prologue
    .line 177
    if-eqz p1, :cond_32

    .line 178
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    if-eqz v0, :cond_33

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    :goto_8
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    .line 179
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    if-eqz v0, :cond_36

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    :goto_10
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    .line 180
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    if-eqz v0, :cond_39

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    :goto_18
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    .line 181
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    if-eqz v0, :cond_3c

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    :goto_20
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    .line 182
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    if-eqz v0, :cond_3f

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    :goto_28
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 183
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    if-eqz v0, :cond_42

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    :goto_30
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    .line 185
    :cond_32
    return-void

    .line 178
    :cond_33
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    goto :goto_8

    .line 179
    :cond_36
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    goto :goto_10

    .line 180
    :cond_39
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    goto :goto_18

    .line 181
    :cond_3c
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    goto :goto_20

    .line 182
    :cond_3f
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    goto :goto_28

    .line 183
    :cond_42
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    goto :goto_30
.end method


# virtual methods
.method public launchExport(Ljava/util/ArrayList;)V
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p1, "rawTrackDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_4
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_c0

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;

    .line 54
    .local v4, "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    new-instance v5, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;

    move-object/from16 v0, p0

    iget-object v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    invoke-direct {v5, v14, v4}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;)V

    .line 55
    .local v5, "rawData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 56
    .local v8, "start":J
    invoke-virtual {v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;->parseRawData()Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;

    move-result-object v6

    .line 57
    .local v6, "rawTrackData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;
    invoke-virtual {v6}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->toString()Ljava/lang/String;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getDebugPath()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    iget-wide v0, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    move-wide/from16 v16, v0

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "-raw.csv"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->compileDataToTrack(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;)Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;

    move-result-object v12

    .line 60
    .local v12, "track":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;
    invoke-static {v12}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcx(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v7

    .line 61
    .local v7, "tcx":Ljava/lang/String;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {v12}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFileName(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ".tcx"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 62
    .local v2, "fileName":Ljava/lang/String;
    invoke-static {v7, v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getShortPath()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {v12}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFileName(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ".tcx"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 65
    .local v3, "filePath":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 66
    .local v10, "stop":J
    move-object/from16 v0, p0

    iget-object v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " saved in "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sub-long v16, v10, v8

    invoke-virtual/range {v15 .. v17}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " ms "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x1

    invoke-virtual/range {v14 .. v16}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->showToast(Ljava/lang/String;I)V

    goto/16 :goto_4

    .line 68
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "filePath":Ljava/lang/String;
    .end local v4    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    .end local v5    # "rawData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;
    .end local v6    # "rawTrackData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;
    .end local v7    # "tcx":Ljava/lang/String;
    .end local v8    # "start":J
    .end local v10    # "stop":J
    .end local v12    # "track":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;
    :cond_c0
    return-void
.end method
