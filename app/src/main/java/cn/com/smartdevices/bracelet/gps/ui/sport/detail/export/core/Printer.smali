.class Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;
.super Ljava/lang/Object;
.source "Printer.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static printRawPoints(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;
    .registers 11
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
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 16
    .local p0, "hrTrackPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    .local p1, "coordTrackPoints":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    .local p2, "stepTrackPoints":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .local v5, "trackPointsBuilder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v7

    if-le v6, v7, :cond_e5

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 19
    .local v0, "csvSize":I
    :goto_13
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 20
    .local v2, "iteratorCoords":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;>;"
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 21
    .local v3, "iteratorSteps":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_24
    if-ge v1, v0, :cond_15f

    .line 23
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_eb

    .line 24
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 25
    .local v4, "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .end local v4    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :goto_50
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_103

    .line 33
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 34
    .restart local v4    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .end local v4    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :goto_96
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_131

    .line 46
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 47
    .restart local v4    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    const-string v6, "second"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    iget-object v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .end local v4    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :goto_dc
    const-string v6, "\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_24

    .line 18
    .end local v0    # "csvSize":I
    .end local v1    # "i":I
    .end local v2    # "iteratorCoords":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;>;"
    .end local v3    # "iteratorSteps":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;>;"
    :cond_e5
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    goto/16 :goto_13

    .line 28
    .restart local v0    # "csvSize":I
    .restart local v1    # "i":I
    .restart local v2    # "iteratorCoords":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;>;"
    .restart local v3    # "iteratorSteps":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;>;>;"
    :cond_eb
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_50

    .line 39
    :cond_103
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_96

    .line 52
    :cond_131
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_dc

    .line 59
    :cond_15f
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method static printTcx(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;
    .registers 7
    .param p0, "track"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;

    .prologue
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<TrainingCenterDatabase xsi:schemaLocation=\"\nhttp://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 \nhttp://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd\" \nxmlns:ns5=\"http://www.garmin.com/xmlschemas/ActivityGoals/v1\" \nxmlns:ns3=\"http://www.garmin.com/xmlschemas/ActivityExtension/v2\" \nxmlns:ns2=\"http://www.garmin.com/xmlschemas/UserProfile/v2\" \nxmlns=\"http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2\" \nxmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n<Activities>\n<Activity Sport=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 74
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->getActivityTypeDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\">\n<Id>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->startTime:J

    .line 75
    invoke-static {v2, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Id>\n<Lap StartTime=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 76
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->getStartTimeAsDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\">\n<TotalTimeSeconds>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->endTime:J

    iget-wide v4, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->startTime:J

    sub-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</TotalTimeSeconds>\n<DistanceMeters>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->distance:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</DistanceMeters>\n<Track>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 80
    invoke-static {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Track>\n</Lap>\n</Activity>\n</Activities>\n</TrainingCenterDatabase>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 63
    return-object v0
.end method

.method private static printTcxAltitude(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .prologue
    .line 116
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    if-eqz v0, :cond_22

    .line 117
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<AltitudeMeters>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 118
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->getAltitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</AltitudeMeters>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 120
    :goto_21
    return-object v0

    :cond_22
    const-string v0, ""

    goto :goto_21
.end method

.method private static printTcxCadence(Ljava/lang/Integer;)Ljava/lang/String;
    .registers 3
    .param p0, "cadence"    # Ljava/lang/Integer;

    .prologue
    .line 134
    if-eqz p0, :cond_1c

    .line 135
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<Cadence>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Cadence>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 138
    :goto_1b
    return-object v0

    :cond_1c
    const-string v0, ""

    goto :goto_1b
.end method

.method private static printTcxHeartRate(Ljava/lang/Integer;)Ljava/lang/String;
    .registers 3
    .param p0, "heartRate"    # Ljava/lang/Integer;

    .prologue
    .line 124
    if-eqz p0, :cond_1c

    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<HeartRateBpm><Value>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Value></HeartRateBpm>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 130
    :goto_1b
    return-object v0

    :cond_1c
    const-string v0, ""

    goto :goto_1b
.end method

.method private static printTcxLatitude(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .prologue
    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<LatitudeDegrees>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 96
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->getLatitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</LatitudeDegrees>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 95
    return-object v0
.end method

.method private static printTcxLongitude(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .prologue
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<LongitudeDegrees>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 102
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->getLongitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</LongitudeDegrees>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 101
    return-object v0
.end method

.method private static printTcxPoints(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;)Ljava/lang/String;
    .registers 5
    .param p0, "track"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;

    .prologue
    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 154
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 155
    .local v1, "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-static {v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxTrackPoint(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 157
    .end local v1    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_1f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static printTcxPosition(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .prologue
    .line 107
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    if-eqz v0, :cond_2e

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<Position>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 109
    invoke-static {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxLatitude(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 110
    invoke-static {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxLongitude(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Position>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 112
    :goto_2d
    return-object v0

    :cond_2e
    const-string v0, ""

    goto :goto_2d
.end method

.method private static printTcxTime(Ljava/lang/Long;)Ljava/lang/String;
    .registers 5
    .param p0, "timestamp"    # Ljava/lang/Long;

    .prologue
    .line 89
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<Time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 90
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 89
    return-object v0
.end method

.method private static printTcxTrackPoint(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .prologue
    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<Trackpoint>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 143
    invoke-static {v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxTime(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 144
    invoke-static {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxPosition(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 145
    invoke-static {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxAltitude(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    .line 146
    invoke-static {v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxHeartRate(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 147
    invoke-static {v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Printer;->printTcxCadence(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Trackpoint>\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 142
    return-object v0
.end method
