.class public Lsergentum/export/core/TrackExporter;
.super Ljava/lang/Object;
.source "TrackExporter.java"


# static fields
.field public static mi2sport:Ljava/util/HashMap;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lsergentum/export/core/Model$ActivityType;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private starter:Lsergentum/export/Starter;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 26
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    .line 28
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/4 v1, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->WALKING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/4 v1, 0x7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->TREADMILL:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    const/16 v1, 0x9

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v2, Lsergentum/export/core/Model$ActivityType;->CYCLING:Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    return-void
.end method

.method public constructor <init>(Lsergentum/export/Starter;)V
    .registers 2
    .param p1, "starter"    # Lsergentum/export/Starter;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    .line 43
    return-void
.end method

.method private compileDataToTrack(Lsergentum/export/core/RawData$RawTrackData;)Lsergentum/export/core/Model$Track;
    .registers 26
    .param p1, "rawTrackData"    # Lsergentum/export/core/RawData$RawTrackData;

    .prologue
    .line 67
    new-instance v16, Lsergentum/export/core/Model$Track;

    invoke-direct/range {v16 .. v16}, Lsergentum/export/core/Model$Track;-><init>()V

    .line 68
    .local v16, "track":Lsergentum/export/core/Model$Track;
    new-instance v18, Lsergentum/export/core/Model$TrackSummary;

    invoke-direct/range {v18 .. v18}, Lsergentum/export/core/Model$TrackSummary;-><init>()V

    .line 69
    .local v18, "trackSummary":Lsergentum/export/core/Model$TrackSummary;
    move-object/from16 v0, p1

    iget-wide v14, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 71
    .local v14, "timestamp":J
    sget-object v19, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->activityType:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lsergentum/export/core/Model$ActivityType;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    iput-object v0, v1, Lsergentum/export/core/Model$TrackSummary;->activityType:Lsergentum/export/core/Model$ActivityType;

    .line 72
    move-object/from16 v0, v18

    iput-wide v14, v0, Lsergentum/export/core/Model$TrackSummary;->id:J

    .line 73
    move-object/from16 v0, p1

    iget-wide v0, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    move-object/from16 v2, v18

    iput-wide v0, v2, Lsergentum/export/core/Model$TrackSummary;->startTime:J

    .line 74
    move-object/from16 v0, p1

    iget-wide v0, v0, Lsergentum/export/core/RawData$RawTrackData;->endTime:J

    move-wide/from16 v20, v0

    move-wide/from16 v0, v20

    move-object/from16 v2, v18

    iput-wide v0, v2, Lsergentum/export/core/Model$TrackSummary;->endTime:J

    .line 75
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->costTime:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lsergentum/export/core/Model$TrackSummary;->duration:I

    .line 76
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->distance:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lsergentum/export/core/Model$TrackSummary;->distance:I

    .line 77
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->size:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, v18

    iput v0, v1, Lsergentum/export/core/Model$TrackSummary;->size:I

    .line 78
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    iput-object v0, v1, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    .line 82
    move-object/from16 v0, p1

    iget-wide v14, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 83
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 84
    .local v8, "hrTrackPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$TrackPoint;>;"
    move-object/from16 v0, p1

    iget-object v7, v0, Lsergentum/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    .line 85
    .local v7, "hrPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_7d
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_a6

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 86
    .local v6, "hrPoint":Ljava/lang/Integer;
    new-instance v17, Lsergentum/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lsergentum/export/core/Model$TrackPoint;-><init>()V

    .line 87
    .local v17, "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    iput-object v0, v1, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 88
    move-object/from16 v0, v17

    iput-object v6, v0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    .line 89
    move-object/from16 v0, v17

    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    const-wide/16 v20, 0x1

    add-long v14, v14, v20

    .line 91
    goto :goto_7d

    .line 93
    .end local v6    # "hrPoint":Ljava/lang/Integer;
    .end local v17    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_a6
    move-object/from16 v0, p1

    iget-wide v14, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 94
    new-instance v4, Ljava/util/TreeMap;

    invoke-direct {v4}, Ljava/util/TreeMap;-><init>()V

    .line 95
    .local v4, "coordTrackPointMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_b0
    move-object/from16 v0, p1

    iget v0, v0, Lsergentum/export/core/RawData$RawTrackData;->size:I

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v9, v0, :cond_157

    .line 96
    new-instance v17, Lsergentum/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lsergentum/export/core/Model$TrackPoint;-><init>()V

    .line 97
    .restart local v17    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/RawData$RawTrackData;->times:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    .line 98
    .local v10, "integer":Ljava/lang/Integer;
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v19

    if-nez v19, :cond_d9

    .line 99
    const/16 v19, 0x1

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 101
    :cond_d9
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lsergentum/export/core/Model$Coordinate;

    move-object/from16 v0, v19

    iget-wide v0, v0, Lsergentum/export/core/Model$Coordinate;->altitude:J

    move-wide/from16 v20, v0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    .line 102
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lsergentum/export/core/Model$Coordinate;

    move-object/from16 v0, v19

    iget-wide v0, v0, Lsergentum/export/core/Model$Coordinate;->latitude:J

    move-wide/from16 v20, v0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    .line 103
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lsergentum/export/core/Model$Coordinate;

    move-object/from16 v0, v19

    iget-wide v0, v0, Lsergentum/export/core/Model$Coordinate;->longitude:J

    move-wide/from16 v20, v0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    .line 104
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v19

    move/from16 v0, v19

    int-to-long v0, v0

    move-wide/from16 v20, v0

    add-long v14, v14, v20

    .line 105
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    iput-object v0, v1, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 106
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-interface {v4, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_b0

    .line 110
    .end local v10    # "integer":Ljava/lang/Integer;
    .end local v17    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_157
    move-object/from16 v0, p1

    iget-wide v14, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 111
    new-instance v12, Ljava/util/TreeMap;

    invoke-direct {v12}, Ljava/util/TreeMap;-><init>()V

    .line 112
    .local v12, "stepTrackPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    move-object/from16 v0, p1

    iget-object v13, v0, Lsergentum/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    .line 113
    .local v13, "steps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$Step;>;"
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_168
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_1b6

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lsergentum/export/core/Model$Step;

    .line 114
    .local v11, "step":Lsergentum/export/core/Model$Step;
    new-instance v17, Lsergentum/export/core/Model$TrackPoint;

    invoke-direct/range {v17 .. v17}, Lsergentum/export/core/Model$TrackPoint;-><init>()V

    .line 116
    .restart local v17    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    iget v0, v11, Lsergentum/export/core/Model$Step;->cadence:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    iput-object v0, v1, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 117
    iget v0, v11, Lsergentum/export/core/Model$Step;->stride:I

    move/from16 v20, v0

    invoke-static/range {v20 .. v20}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    iput-object v0, v1, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    .line 118
    iget v0, v11, Lsergentum/export/core/Model$Step;->first:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    add-long v14, v14, v20

    .line 119
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    iput-object v0, v1, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 120
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-interface {v12, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_168

    .line 123
    .end local v11    # "step":Lsergentum/export/core/Model$Step;
    .end local v17    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_1b6
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lsergentum/export/Starter;->getDebug()Ljava/lang/Boolean;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v19

    if-eqz v19, :cond_1fc

    .line 124
    invoke-static {v8, v4, v12}, Lsergentum/export/core/Printer;->printRawPoints(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    .line 125
    .local v5, "debugPoints":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/Starter;->getDebugPath()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p1

    iget-wide v0, v0, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    move-wide/from16 v22, v0

    move-object/from16 v0, v20

    move-wide/from16 v1, v22

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "-points.csv"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v5, v1}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 128
    .end local v5    # "debugPoints":Ljava/lang/String;
    :cond_1fc
    move-object/from16 v0, p0

    invoke-direct {v0, v8, v4, v12}, Lsergentum/export/core/TrackExporter;->joinPointArrays(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    iput-object v0, v1, Lsergentum/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    .line 129
    return-object v16
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
    .line 138
    .local p1, "hrPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$TrackPoint;>;"
    .local p2, "coordPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    .local p3, "stepPointsMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
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

    .line 140
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .local v6, "resultPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$TrackPoint;>;"
    const/4 v5, 0x0

    .line 143
    .local v5, "lastHrPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_2c
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_79

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsergentum/export/core/Model$TrackPoint;

    .line 144
    .local v4, "hrPoint":Lsergentum/export/core/Model$TrackPoint;
    iget-object v11, v4, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 145
    .local v8, "timestamp":J
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsergentum/export/core/Model$TrackPoint;

    .line 146
    .local v2, "coordPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v4, v2}, Lsergentum/export/core/TrackExporter;->joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V

    .line 147
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    invoke-interface/range {p3 .. p3}, Ljava/util/Map;->size()I

    move-result v11

    if-lez v11, :cond_74

    .line 150
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lsergentum/export/core/Model$TrackPoint;

    .line 151
    .local v7, "stepPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v4, v7}, Lsergentum/export/core/TrackExporter;->joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V

    .line 152
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-interface {v0, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    .end local v7    # "stepPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_74
    invoke-virtual {v6, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    move-object v5, v4

    .line 156
    goto :goto_2c

    .line 158
    .end local v2    # "coordPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v4    # "hrPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v8    # "timestamp":J
    :cond_79
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_81
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_b3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 159
    .local v3, "coordTrackPointEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    .line 160
    .restart local v8    # "timestamp":J
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsergentum/export/core/Model$TrackPoint;

    .line 161
    .restart local v2    # "coordPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-interface {v0, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lsergentum/export/core/Model$TrackPoint;

    .line 162
    .restart local v7    # "stepPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v2, v7}, Lsergentum/export/core/TrackExporter;->joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V

    .line 163
    invoke-static {v2, v5}, Lsergentum/export/core/TrackExporter;->joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V

    .line 164
    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_81

    .line 166
    .end local v2    # "coordPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v3    # "coordTrackPointEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    .end local v7    # "stepPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v8    # "timestamp":J
    :cond_b3
    iget-object v10, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Coord points map after join:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    invoke-virtual {v10, v11}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 167
    return-object v6
.end method

.method private static joinPoints(Lsergentum/export/core/Model$TrackPoint;Lsergentum/export/core/Model$TrackPoint;)V
    .registers 3
    .param p0, "p1"    # Lsergentum/export/core/Model$TrackPoint;
    .param p1, "p2"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 171
    if-eqz p1, :cond_32

    .line 172
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    if-eqz v0, :cond_33

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    :goto_8
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    .line 173
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    if-eqz v0, :cond_36

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    :goto_10
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    .line 174
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    if-eqz v0, :cond_39

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    :goto_18
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    .line 175
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    if-eqz v0, :cond_3c

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    :goto_20
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    .line 176
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    if-eqz v0, :cond_3f

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    :goto_28
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 177
    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    if-eqz v0, :cond_42

    iget-object v0, p1, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    :goto_30
    iput-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    .line 179
    :cond_32
    return-void

    .line 172
    :cond_33
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    goto :goto_8

    .line 173
    :cond_36
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    goto :goto_10

    .line 174
    :cond_39
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    goto :goto_18

    .line 175
    :cond_3c
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    goto :goto_20

    .line 176
    :cond_3f
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    goto :goto_28

    .line 177
    :cond_42
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    goto :goto_30
.end method


# virtual methods
.method public compileTrack(Lsergentum/export/core/RawData$QueryData;)Lsergentum/export/core/Model$Track;
    .registers 13
    .param p1, "queryData"    # Lsergentum/export/core/RawData$QueryData;

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 46
    new-instance v4, Lsergentum/export/core/RawData;

    iget-object v6, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    invoke-direct {v4, v6, p1}, Lsergentum/export/core/RawData;-><init>(Lsergentum/export/Starter;Lsergentum/export/core/RawData$QueryData;)V

    .line 47
    .local v4, "rawData":Lsergentum/export/core/RawData;
    invoke-virtual {v4}, Lsergentum/export/core/RawData;->parseRawData()Lsergentum/export/core/RawData$RawTrackData;

    move-result-object v5

    .line 49
    .local v5, "rawTrackData":Lsergentum/export/core/RawData$RawTrackData;
    iget-object v6, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    invoke-virtual {v6}, Lsergentum/export/Starter;->getDebug()Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_8f

    .line 50
    iget-object v6, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    new-array v7, v9, [Ljava/lang/String;

    const-string v8, "Will try to write raw data to file."

    aput-object v8, v7, v10

    invoke-virtual {v6, v7}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 51
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p1, Lsergentum/export/core/RawData$QueryData;->startTime:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "-raw.csv"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 52
    .local v2, "filename":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v7, Lsergentum/export/Starter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "debug/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 53
    .local v1, "filePath":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/Starter;->getFullPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 54
    .local v3, "fullPath":Ljava/lang/String;
    iget-object v6, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    invoke-virtual {v5}, Lsergentum/export/core/RawData$RawTrackData;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v3}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 55
    .local v0, "b":Z
    if-eqz v0, :cond_94

    .line 56
    iget-object v6, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    new-array v7, v9, [Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " saved"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-virtual {v6, v7}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 62
    .end local v0    # "b":Z
    .end local v1    # "filePath":Ljava/lang/String;
    .end local v2    # "filename":Ljava/lang/String;
    .end local v3    # "fullPath":Ljava/lang/String;
    :cond_8f
    :goto_8f
    invoke-direct {p0, v5}, Lsergentum/export/core/TrackExporter;->compileDataToTrack(Lsergentum/export/core/RawData$RawTrackData;)Lsergentum/export/core/Model$Track;

    move-result-object v6

    return-object v6

    .line 58
    .restart local v0    # "b":Z
    .restart local v1    # "filePath":Ljava/lang/String;
    .restart local v2    # "filename":Ljava/lang/String;
    .restart local v3    # "fullPath":Ljava/lang/String;
    :cond_94
    iget-object v6, p0, Lsergentum/export/core/TrackExporter;->starter:Lsergentum/export/Starter;

    new-array v7, v9, [Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " can\'t save"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-virtual {v6, v7}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    goto :goto_8f
.end method
