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
    .line 84
    new-instance v16, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;

    invoke-direct/range {v16 .. v16}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;-><init>()V

    .line 85
    .local v16, "track":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    .line 87
    .local v14, "timestamp":J
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->size:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, v16

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->size:I

    .line 88
    move-object/from16 v0, v16

    iput-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->startTime:J

    .line 89
    move-object/from16 v0, p1

    iget-wide v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->endTime:J

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    move-object/from16 v2, v16

    iput-wide v0, v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->endTime:J

    .line 90
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->costTime:I

    move/from16 v18, v0

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    move-object/from16 v2, v16

    iput-wide v0, v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->duration:J

    .line 91
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->distance:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, v16

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->distance:I

    .line 92
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->activityType:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, v16

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->activityType:I

    .line 96
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    .line 97
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .local v8, "hrTrackPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    move-object/from16 v0, p1

    iget-object v7, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    .line 99
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

    .line 100
    .local v6, "hrPoint":Ljava/lang/Integer;
    new-instance v17, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;-><init>()V

    .line 101
    .local v17, "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 102
    move-object/from16 v0, v17

    iput-object v6, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    .line 103
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    const-wide/16 v20, 0x1

    add-long v14, v14, v20

    .line 105
    goto :goto_5f

    .line 107
    .end local v6    # "hrPoint":Ljava/lang/Integer;
    .end local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_88
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    .line 108
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 109
    .local v4, "coordTrackPointMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_92
    move-object/from16 v0, p1

    iget v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->size:I

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v9, v0, :cond_139

    .line 110
    new-instance v17, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;-><init>()V

    .line 111
    .restart local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    move-object/from16 v0, p1

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->times:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    .line 112
    .local v10, "integer":Ljava/lang/Integer;
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v18

    if-nez v18, :cond_bb

    .line 113
    const/16 v18, 0x1

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 115
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

    .line 116
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

    .line 117
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

    .line 118
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    add-long v14, v14, v18

    .line 119
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 120
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v17

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_92

    .line 124
    .end local v10    # "integer":Ljava/lang/Integer;
    .end local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_139
    move-object/from16 v0, p1

    iget-wide v14, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    .line 125
    new-instance v12, Ljava/util/TreeMap;

    invoke-direct {v12}, Ljava/util/TreeMap;-><init>()V

    .line 126
    .local v12, "stepTrackPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    move-object/from16 v0, p1

    iget-object v13, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    .line 127
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

    .line 128
    .local v11, "step":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;
    new-instance v17, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;-><init>()V

    .line 130
    .restart local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    iget v0, v11, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->cadence:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 131
    iget v0, v11, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->stride:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    .line 132
    iget v0, v11, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->first:I

    move/from16 v19, v0

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v20, v0

    add-long v14, v14, v20

    .line 133
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 134
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-interface {v12, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_14a

    .line 137
    .end local v11    # "step":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;
    .end local v17    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_198
    sget-boolean v18, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->debug:Z

    if-eqz v18, :cond_1ca

    .line 138
    invoke-static {v8, v4, v12}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printRawPoints(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    .line 139
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

    invoke-static {v5, v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 142
    .end local v5    # "debugPoints":Ljava/lang/String;
    :cond_1ca
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v4, v12}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPointArrays(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    iput-object v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    .line 143
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
    .line 78
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s_%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-wide v4, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->startTime:J

    .line 79
    invoke-static {v4, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestampHumanReadable(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->distance:I

    .line 80
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 78
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
    .line 151
    .local p1, "hrPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    .local p2, "coordPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    .local p3, "stepPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    sget-boolean v10, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->debug:Z

    if-eqz v10, :cond_26

    .line 152
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

    .line 154
    :cond_26
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v6, "resultPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    const/4 v5, 0x0

    .line 157
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

    .line 158
    .local v4, "hrPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    iget-object v11, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 159
    .local v8, "timestamp":J
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 160
    .local v2, "coordPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v4, v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V

    .line 161
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->size()I

    move-result v11

    if-lez v11, :cond_78

    .line 164
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 165
    .local v7, "stepPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v4, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V

    .line 166
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .end local v7    # "stepPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_78
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    move-object v5, v4

    .line 170
    goto :goto_30

    .line 172
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

    .line 173
    .local v3, "coordTrackPointEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 174
    .restart local v8    # "timestamp":J
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 175
    .restart local v2    # "coordPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 176
    .restart local v7    # "stepPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v2, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V

    .line 177
    invoke-static {v2, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->joinPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)V

    .line 178
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_85

    .line 180
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
    .line 184
    if-eqz p1, :cond_32

    .line 185
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    if-eqz v0, :cond_33

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    :goto_8
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    .line 186
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    if-eqz v0, :cond_36

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    :goto_10
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    .line 187
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    if-eqz v0, :cond_39

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    :goto_18
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    .line 188
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    if-eqz v0, :cond_3c

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    :goto_20
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    .line 189
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    if-eqz v0, :cond_3f

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    :goto_28
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 190
    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    if-eqz v0, :cond_42

    iget-object v0, p1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    :goto_30
    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    .line 192
    :cond_32
    return-void

    .line 185
    :cond_33
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    goto :goto_8

    .line 186
    :cond_36
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    goto :goto_10

    .line 187
    :cond_39
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    goto :goto_18

    .line 188
    :cond_3c
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    goto :goto_20

    .line 189
    :cond_3f
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    goto :goto_28

    .line 190
    :cond_42
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    goto :goto_30
.end method


# virtual methods
.method public launchExport(Ljava/util/ArrayList;)V
    .registers 24
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

    move-result-object v17

    :goto_4
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_101

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;

    .line 54
    .local v6, "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    new-instance v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-direct {v7, v0, v6}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;)V

    .line 55
    .local v7, "rawData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    .line 56
    .local v10, "start":J
    invoke-virtual {v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;->parseRawData()Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;

    move-result-object v8

    .line 57
    .local v8, "rawTrackData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;
    sget-boolean v18, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->debug:Z

    if-eqz v18, :cond_4f

    .line 58
    invoke-virtual {v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->toString()Ljava/lang/String;

    move-result-object v18

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getDebugPath()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    iget-wide v0, v8, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-raw.csv"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 61
    :cond_4f
    move-object/from16 v0, p0

    invoke-direct {v0, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->compileDataToTrack(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;)Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;

    move-result-object v16

    .line 62
    .local v16, "track":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;
    invoke-static/range {v16 .. v16}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcx(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v15

    .line 63
    .local v15, "tcx":Ljava/lang/String;
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-static/range {v16 .. v16}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFileName(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ".tcx"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 64
    .local v4, "fileName":Ljava/lang/String;
    invoke-static {v15, v4}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v14

    .line 66
    .local v14, "successfull":Z
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getShortPath()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-static/range {v16 .. v16}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFileName(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, ".tcx"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 67
    .local v5, "filePath":Ljava/lang/String;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    .line 68
    .local v12, "stop":J
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " saved in "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    sub-long v20, v12, v10

    move-object/from16 v0, v18

    move-wide/from16 v1, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " ms "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 69
    .local v9, "successMessage":Ljava/lang/String;
    if-nez v14, :cond_db

    .line 70
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, " UNSUCCESSFULLY "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 72
    :cond_db
    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v9, v19, v20

    invoke-virtual/range {v18 .. v19}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 73
    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-virtual {v0, v9, v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->showToast(Ljava/lang/String;I)V

    goto/16 :goto_4

    .line 75
    .end local v4    # "fileName":Ljava/lang/String;
    .end local v5    # "filePath":Ljava/lang/String;
    .end local v6    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    .end local v7    # "rawData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;
    .end local v8    # "rawTrackData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;
    .end local v9    # "successMessage":Ljava/lang/String;
    .end local v10    # "start":J
    .end local v12    # "stop":J
    .end local v14    # "successfull":Z
    .end local v15    # "tcx":Ljava/lang/String;
    .end local v16    # "track":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;
    :cond_101
    return-void
.end method
