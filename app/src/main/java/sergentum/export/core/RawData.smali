.class public Lsergentum/export/core/RawData;
.super Ljava/lang/Object;
.source "RawData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lsergentum/export/core/RawData$RawTrackData;,
        Lsergentum/export/core/RawData$QueryData;
    }
.end annotation


# instance fields
.field private queryData:Lsergentum/export/core/RawData$QueryData;

.field private starter:Lsergentum/export/Starter;


# direct methods
.method constructor <init>(Lsergentum/export/Starter;Lsergentum/export/core/RawData$QueryData;)V
    .registers 3
    .param p1, "starter"    # Lsergentum/export/Starter;
    .param p2, "queryData"    # Lsergentum/export/core/RawData$QueryData;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lsergentum/export/core/RawData;->starter:Lsergentum/export/Starter;

    .line 18
    iput-object p2, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    .line 19
    return-void
.end method

.method private parseCoordinate(Ljava/lang/String;Ljava/lang/String;Lsergentum/export/core/Model$Coordinate;)Lsergentum/export/core/Model$Coordinate;
    .registers 15
    .param p1, "llString"    # Ljava/lang/String;
    .param p2, "alString"    # Ljava/lang/String;
    .param p3, "prevCoord"    # Lsergentum/export/core/Model$Coordinate;

    .prologue
    const/4 v1, 0x0

    const/4 v10, 0x1

    .line 151
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x3

    if-ge v8, v9, :cond_a

    .line 169
    :cond_9
    :goto_9
    return-object v1

    .line 154
    :cond_a
    const-string v8, ","

    invoke-virtual {p1, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 155
    .local v0, "stringCoords":[Ljava/lang/String;
    array-length v8, v0

    if-le v8, v10, :cond_9

    .line 156
    const/4 v1, 0x0

    aget-object v1, v0, v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 157
    .local v2, "currentLat":J
    aget-object v1, v0, v10

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    .line 158
    .local v4, "currentLon":J
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 159
    .local v6, "currentAlt":J
    if-nez p3, :cond_2c

    .line 161
    new-instance v1, Lsergentum/export/core/Model$Coordinate;

    invoke-direct/range {v1 .. v7}, Lsergentum/export/core/Model$Coordinate;-><init>(JJJ)V

    goto :goto_9

    .line 164
    :cond_2c
    iget-wide v8, p3, Lsergentum/export/core/Model$Coordinate;->latitude:J

    add-long/2addr v2, v8

    .line 165
    iget-wide v8, p3, Lsergentum/export/core/Model$Coordinate;->longitude:J

    add-long/2addr v4, v8

    .line 166
    new-instance v1, Lsergentum/export/core/Model$Coordinate;

    invoke-direct/range {v1 .. v7}, Lsergentum/export/core/Model$Coordinate;-><init>(JJJ)V

    goto :goto_9
.end method

.method private parseCoordinates(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 12
    .param p1, "BULKLL"    # Ljava/lang/String;
    .param p2, "BULKAL"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lsergentum/export/core/Model$Coordinate;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    .line 131
    const-string v6, ";"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 132
    .local v1, "BULKLL_stringArr":[Ljava/lang/String;
    const-string v6, ";"

    invoke-virtual {p2, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "BULKAL_split":[Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v3, "coordinates":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$Coordinate;>;"
    array-length v6, v1

    const/4 v7, 0x1

    if-le v6, v7, :cond_35

    .line 136
    aget-object v6, v1, v8

    aget-object v7, v0, v8

    const/4 v8, 0x0

    invoke-direct {p0, v6, v7, v8}, Lsergentum/export/core/RawData;->parseCoordinate(Ljava/lang/String;Ljava/lang/String;Lsergentum/export/core/Model$Coordinate;)Lsergentum/export/core/Model$Coordinate;

    move-result-object v2

    .line 137
    .local v2, "coordinate":Lsergentum/export/core/Model$Coordinate;
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 138
    const/4 v5, 0x1

    .local v5, "i":I
    :goto_23
    array-length v6, v1

    if-ge v5, v6, :cond_35

    .line 139
    aget-object v6, v1, v5

    aget-object v7, v0, v5

    invoke-direct {p0, v6, v7, v2}, Lsergentum/export/core/RawData;->parseCoordinate(Ljava/lang/String;Ljava/lang/String;Lsergentum/export/core/Model$Coordinate;)Lsergentum/export/core/Model$Coordinate;

    move-result-object v4

    .line 140
    .local v4, "currentCoordinate":Lsergentum/export/core/Model$Coordinate;
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    move-object v2, v4

    .line 138
    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    .line 146
    .end local v2    # "coordinate":Lsergentum/export/core/Model$Coordinate;
    .end local v4    # "currentCoordinate":Lsergentum/export/core/Model$Coordinate;
    .end local v5    # "i":I
    :cond_35
    return-object v3
.end method

.method private parseHR(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 16
    .param p1, "BULKHR"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    const/4 v13, 0x0

    .line 77
    const-string v12, ";"

    invoke-virtual {p1, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 78
    .local v0, "BULKHR_split":[Ljava/lang/String;
    array-length v12, v0

    if-ge v12, v11, :cond_11

    .line 79
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 101
    :cond_10
    return-object v5

    .line 81
    :cond_11
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 82
    .local v5, "hrPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    aget-object v10, v0, v13

    .line 83
    .local v10, "startHrAsString":Ljava/lang/String;
    const-string v12, ","

    invoke-virtual {v10, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 84
    .local v9, "startHr":[Ljava/lang/String;
    aget-object v12, v9, v13

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_3f

    aget-object v12, v9, v13

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 85
    .local v1, "count":I
    :goto_2c
    aget-object v12, v9, v11

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 86
    .local v6, "hrValue":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_33
    if-ge v7, v1, :cond_41

    .line 87
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    add-int/lit8 v7, v7, 0x1

    goto :goto_33

    .end local v1    # "count":I
    .end local v6    # "hrValue":I
    .end local v7    # "i":I
    :cond_3f
    move v1, v11

    .line 84
    goto :goto_2c

    .line 90
    .restart local v1    # "count":I
    .restart local v6    # "hrValue":I
    .restart local v7    # "i":I
    :cond_41
    const/4 v7, 0x1

    :goto_42
    array-length v12, v0

    if-ge v7, v12, :cond_10

    .line 91
    aget-object v4, v0, v7

    .line 92
    .local v4, "hrPointAsString":Ljava/lang/String;
    const-string v12, ","

    invoke-virtual {v4, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 93
    .local v3, "hrPointAsArr":[Ljava/lang/String;
    aget-object v12, v3, v11

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 95
    .local v2, "hrIncrement":I
    add-int/2addr v6, v2

    .line 96
    aget-object v12, v3, v13

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 97
    const/4 v8, 0x0

    .local v8, "j":I
    :goto_5b
    if-ge v8, v1, :cond_67

    .line 98
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 97
    add-int/lit8 v8, v8, 0x1

    goto :goto_5b

    .line 90
    :cond_67
    add-int/lit8 v7, v7, 0x1

    goto :goto_42
.end method

.method private parseStep(Ljava/lang/String;)Lsergentum/export/core/Model$Step;
    .registers 9
    .param p1, "stepAsString"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x3

    .line 64
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-le v5, v6, :cond_2e

    .line 65
    const-string v5, ","

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 66
    .local v3, "stepParts":[Ljava/lang/String;
    const/4 v5, 0x0

    aget-object v5, v3, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 67
    .local v1, "first":I
    const/4 v5, 0x1

    aget-object v5, v3, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 68
    .local v2, "second":I
    const/4 v5, 0x2

    aget-object v5, v3, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 69
    .local v4, "stride":I
    aget-object v5, v3, v6

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 70
    .local v0, "cadence":I
    new-instance v5, Lsergentum/export/core/Model$Step;

    invoke-direct {v5, v1, v2, v4, v0}, Lsergentum/export/core/Model$Step;-><init>(IIII)V

    .line 72
    .end local v0    # "cadence":I
    .end local v1    # "first":I
    .end local v2    # "second":I
    .end local v3    # "stepParts":[Ljava/lang/String;
    .end local v4    # "stride":I
    :goto_2d
    return-object v5

    :cond_2e
    const/4 v5, 0x0

    goto :goto_2d
.end method

.method private parseSteps(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 8
    .param p1, "BULKGAIT"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lsergentum/export/core/Model$Step;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .local v3, "steps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$Step;>;"
    if-eqz p1, :cond_e

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x1

    if-ge v4, v5, :cond_f

    .line 60
    :cond_e
    return-object v3

    .line 53
    :cond_f
    const-string v4, ";"

    invoke-virtual {p1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 54
    .local v0, "BULKGAIT_split":[Ljava/lang/String;
    array-length v5, v0

    const/4 v4, 0x0

    :goto_17
    if-ge v4, v5, :cond_e

    aget-object v2, v0, v4

    .line 55
    .local v2, "stepString":Ljava/lang/String;
    invoke-direct {p0, v2}, Lsergentum/export/core/RawData;->parseStep(Ljava/lang/String;)Lsergentum/export/core/Model$Step;

    move-result-object v1

    .line 56
    .local v1, "step":Lsergentum/export/core/Model$Step;
    if-eqz v1, :cond_24

    .line 57
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    :cond_24
    add-int/lit8 v4, v4, 0x1

    goto :goto_17
.end method

.method private parseTime(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 10
    .param p1, "BULKTIME"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 105
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .local v5, "times":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    if-le v6, v7, :cond_40

    .line 107
    const-string v6, ";"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "BULKTIME_split":[Ljava/lang/String;
    const/4 v1, 0x0

    .line 109
    .local v1, "firstNumber":I
    const/4 v2, 0x0

    .local v2, "index":I
    :goto_14
    array-length v6, v0

    if-ge v2, v6, :cond_40

    .line 110
    aget-object v4, v0, v2

    .line 111
    .local v4, "timeString":Ljava/lang/String;
    if-eqz v4, :cond_36

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_36

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 115
    .local v3, "time":I
    :goto_25
    if-nez v2, :cond_28

    .line 116
    move v1, v3

    .line 119
    :cond_28
    if-lez v1, :cond_38

    .line 120
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 121
    add-int/lit8 v1, v1, -0x1

    .line 109
    :goto_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    .line 111
    .end local v3    # "time":I
    :cond_36
    const/4 v3, 0x0

    goto :goto_25

    .line 123
    .restart local v3    # "time":I
    :cond_38
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_33

    .line 127
    .end local v0    # "BULKTIME_split":[Ljava/lang/String;
    .end local v1    # "firstNumber":I
    .end local v2    # "index":I
    .end local v3    # "time":I
    .end local v4    # "timeString":Ljava/lang/String;
    :cond_40
    return-object v5
.end method


# virtual methods
.method parseRawData()Lsergentum/export/core/RawData$RawTrackData;
    .registers 8

    .prologue
    .line 22
    new-instance v2, Lsergentum/export/core/RawData$RawTrackData;

    invoke-direct {v2}, Lsergentum/export/core/RawData$RawTrackData;-><init>()V

    .line 24
    .local v2, "rawTrackData":Lsergentum/export/core/RawData$RawTrackData;
    :try_start_5
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->startTime:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v2, Lsergentum/export/core/RawData$RawTrackData;->startTime:J

    .line 25
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->endTime:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    iput-wide v4, v2, Lsergentum/export/core/RawData$RawTrackData;->endTime:J

    .line 26
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->costTime:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v2, Lsergentum/export/core/RawData$RawTrackData;->costTime:I

    .line 27
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->distance:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v2, Lsergentum/export/core/RawData$RawTrackData;->distance:I

    .line 28
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->activityType:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v2, Lsergentum/export/core/RawData$RawTrackData;->activityType:I

    .line 30
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->BULKTIME:Ljava/lang/String;

    invoke-direct {p0, v4}, Lsergentum/export/core/RawData;->parseTime(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    iput-object v4, v2, Lsergentum/export/core/RawData$RawTrackData;->times:Ljava/util/ArrayList;

    .line 31
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->BULKLL:Ljava/lang/String;

    iget-object v5, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v5, v5, Lsergentum/export/core/RawData$QueryData;->BULKAL:Ljava/lang/String;

    invoke-direct {p0, v4, v5}, Lsergentum/export/core/RawData;->parseCoordinates(Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    iput-object v4, v2, Lsergentum/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    .line 34
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->size:Ljava/lang/String;

    if-eqz v4, :cond_9c

    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->size:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_9c

    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->size:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 35
    .local v3, "size":I
    :goto_67
    if-eqz v3, :cond_9e

    .end local v3    # "size":I
    :goto_69
    iput v3, v2, Lsergentum/export/core/RawData$RawTrackData;->size:I

    .line 37
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->BULKHR:Ljava/lang/String;

    invoke-direct {p0, v4}, Lsergentum/export/core/RawData;->parseHR(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 38
    .local v0, "HRs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iput-object v0, v2, Lsergentum/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    .line 39
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "hrPointsSize:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 41
    iget-object v4, p0, Lsergentum/export/core/RawData;->queryData:Lsergentum/export/core/RawData$QueryData;

    iget-object v4, v4, Lsergentum/export/core/RawData$QueryData;->BULKGAIT:Ljava/lang/String;

    invoke-direct {p0, v4}, Lsergentum/export/core/RawData;->parseSteps(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    iput-object v4, v2, Lsergentum/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    .line 45
    .end local v0    # "HRs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :goto_9b
    return-object v2

    .line 34
    :cond_9c
    const/4 v3, 0x0

    goto :goto_67

    .line 35
    .restart local v3    # "size":I
    :cond_9e
    iget-object v4, v2, Lsergentum/export/core/RawData$RawTrackData;->times:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I
    :try_end_a3
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_a3} :catch_a5

    move-result v3

    goto :goto_69

    .line 42
    .end local v3    # "size":I
    :catch_a5
    move-exception v1

    .line 43
    .local v1, "e":Ljava/lang/Exception;
    iget-object v4, p0, Lsergentum/export/core/RawData;->starter:Lsergentum/export/Starter;

    const-string v5, "ex while parsing: "

    invoke-virtual {v4, v5, v1}, Lsergentum/export/Starter;->log(Ljava/lang/String;Ljava/lang/Exception;)Z

    goto :goto_9b
.end method
