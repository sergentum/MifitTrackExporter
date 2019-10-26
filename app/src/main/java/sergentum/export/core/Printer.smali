.class public Lsergentum/export/core/Printer;
.super Ljava/lang/Object;
.source "Printer.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static printEndomondoTrack(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 13
    .param p0, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 259
    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v8, "yyyy-MM-dd HH:mm:ss \'UTC\'"

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v3, v8, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 260
    .local v3, "simpleDateFormat":Ljava/text/SimpleDateFormat;
    const-string v8, "UTC"

    invoke-static {v8}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 262
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 263
    .local v2, "lines":Ljava/lang/StringBuilder;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 264
    .local v1, "line":Ljava/lang/StringBuilder;
    iget-object v6, p0, Lsergentum/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    .line 265
    .local v6, "trackPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$TrackPoint;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    .local v7, "trackPointsSize":I
    :goto_23
    if-ge v0, v7, :cond_ab

    .line 266
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsergentum/export/core/Model$TrackPoint;

    .line 277
    .local v4, "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    new-instance v5, Ljava/util/Date;

    iget-object v8, v4, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    mul-long/2addr v8, v10

    invoke-direct {v5, v8, v9}, Ljava/util/Date;-><init>(J)V

    .line 278
    .local v5, "trackPointDate":Ljava/util/Date;
    invoke-virtual {v3, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ";"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    if-nez v0, :cond_9b

    .line 280
    const-string v8, "2;"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    :goto_4d
    invoke-virtual {v4}, Lsergentum/export/core/Model$TrackPoint;->getLatitudeString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ";"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    invoke-virtual {v4}, Lsergentum/export/core/Model$TrackPoint;->getLongitudeString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ";"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    const-string v8, ";"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    const-string v8, ";"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 290
    invoke-virtual {v4}, Lsergentum/export/core/Model$TrackPoint;->getAltitudeString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ";"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    invoke-virtual {v4}, Lsergentum/export/core/Model$TrackPoint;->getHeartRateString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ";"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    invoke-virtual {v4}, Lsergentum/export/core/Model$TrackPoint;->getCadenceString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ";\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    add-int/lit8 v0, v0, 0x1

    goto :goto_23

    .line 281
    :cond_9b
    add-int/lit8 v8, v7, -0x1

    if-ne v0, v8, :cond_a5

    .line 282
    const-string v8, "3;"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4d

    .line 284
    :cond_a5
    const-string v8, ";"

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4d

    .line 305
    .end local v4    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    .end local v5    # "trackPointDate":Ljava/util/Date;
    :cond_ab
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method public static printGpx(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 5
    .param p0, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<gpx version=\"1.1\" creator=\"Endomondo.com\"\n    xsi:schemaLocation=\"http://www.topografix.com/GPX/1/1\n    http://www.topografix.com/GPX/1/1/gpx.xsd\n    http://www.garmin.com/xmlschemas/GpxExtensions/v3\n    http://www.garmin.com/xmlschemas/GpxExtensionsv3.xsd\n    http://www.garmin.com/xmlschemas/TrackPointExtension/v1\n    http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd\"\n    xmlns=\"http://www.topografix.com/GPX/1/1\"\n    xmlns:gpxtpx=\"http://www.garmin.com/xmlschemas/TrackPointExtension/v1\"\n    xmlns:gpxx=\"http://www.garmin.com/xmlschemas/GpxExtensions/v3\"\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">    <metadata>\n        <time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    iget-wide v2, v1, Lsergentum/export/core/Model$TrackSummary;->startTime:J

    .line 182
    invoke-static {v2, v3}, Lsergentum/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " </time>\n    </metadata><trk>\n<type>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    .line 185
    invoke-virtual {v1}, Lsergentum/export/core/Model$TrackSummary;->getActivityTypeDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</type><trkseg>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 187
    invoke-static {p0}, Lsergentum/export/core/Printer;->printGpxPoints(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</trkseg>\n</trk>\n</gpx>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 169
    return-object v0
.end method

.method private static printGpxCadence(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 253
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    if-eqz v0, :cond_20

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<gpxtpx:cad>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</gpxtpx:cad>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 255
    :goto_1f
    return-object v0

    :cond_20
    const-string v0, ""

    goto :goto_1f
.end method

.method private static printGpxElevation(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 224
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    if-eqz v0, :cond_22

    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<ele>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lsergentum/export/core/Model$TrackPoint;->getAltitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</ele>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 226
    :goto_21
    return-object v0

    :cond_22
    const-string v0, ""

    goto :goto_21
.end method

.method private static printGpxExtension(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 4
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 234
    const-string v0, ""

    .line 235
    .local v0, "result":Ljava/lang/String;
    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    if-nez v1, :cond_a

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    if-eqz v1, :cond_2f

    .line 236
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "<extensions><gpxtpx:TrackPointExtension>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 238
    invoke-static {p0}, Lsergentum/export/core/Printer;->printGpxHeartRate(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 239
    invoke-static {p0}, Lsergentum/export/core/Printer;->printGpxCadence(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "</gpxtpx:TrackPointExtension></extensions>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 243
    :cond_2f
    return-object v0
.end method

.method private static printGpxHeartRate(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 247
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    if-eqz v0, :cond_20

    .line 248
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<gpxtpx:hr>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</gpxtpx:hr>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 249
    :goto_1f
    return-object v0

    :cond_20
    const-string v0, ""

    goto :goto_1f
.end method

.method private static printGpxLatitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 212
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    if-eqz v0, :cond_22

    .line 213
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " lat=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lsergentum/export/core/Model$TrackPoint;->getLatitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 214
    :goto_21
    return-object v0

    :cond_22
    const-string v0, ""

    goto :goto_21
.end method

.method private static printGpxLongitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 218
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    if-eqz v0, :cond_22

    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " lon=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lsergentum/export/core/Model$TrackPoint;->getLongitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 220
    :goto_21
    return-object v0

    :cond_22
    const-string v0, ""

    goto :goto_21
.end method

.method private static printGpxPoints(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 5
    .param p0, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lsergentum/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsergentum/export/core/Model$TrackPoint;

    .line 196
    .local v1, "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v1}, Lsergentum/export/core/Printer;->printGpxTrackPoint(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 198
    .end local v1    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_1f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static printGpxTime(Ljava/lang/Long;)Ljava/lang/String;
    .registers 5
    .param p0, "timestamp"    # Ljava/lang/Long;

    .prologue
    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Lsergentum/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static printGpxTrackPoint(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<trkpt"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lsergentum/export/core/Printer;->printGpxLatitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lsergentum/export/core/Printer;->printGpxLongitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 203
    invoke-static {p0}, Lsergentum/export/core/Printer;->printGpxElevation(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 204
    invoke-static {v1}, Lsergentum/export/core/Printer;->printGpxTime(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 205
    invoke-static {p0}, Lsergentum/export/core/Printer;->printGpxExtension(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</trkpt>\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 202
    return-object v0
.end method

.method static printRawPoints(Ljava/util/ArrayList;Ljava/util/Map;Ljava/util/Map;)Ljava/lang/String;
    .registers 11
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
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "hrTrackPoints":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lsergentum/export/core/Model$TrackPoint;>;"
    .local p1, "coordTrackPoints":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    .local p2, "stepTrackPoints":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .local v5, "trackPointsBuilder":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 27
    .local v0, "csvSize":I
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 28
    .local v2, "iteratorCoords":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;>;"
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 29
    .local v3, "iteratorSteps":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackPoint;>;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_22
    if-ge v1, v0, :cond_156

    .line 31
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_e3

    .line 32
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsergentum/export/core/Model$TrackPoint;

    .line 33
    .local v4, "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Lsergentum/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .end local v4    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :goto_4e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_fb

    .line 41
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsergentum/export/core/Model$TrackPoint;

    .line 42
    .restart local v4    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Lsergentum/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .end local v4    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :goto_94
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_129

    .line 54
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsergentum/export/core/Model$TrackPoint;

    .line 55
    .restart local v4    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v6, v7}, Lsergentum/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    const-string v6, "second"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    iget-object v6, v4, Lsergentum/export/core/Model$TrackPoint;->stride:Ljava/lang/Integer;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .end local v4    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :goto_da
    const-string v6, "\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_22

    .line 36
    :cond_e3
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_4e

    .line 47
    :cond_fb
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_94

    .line 60
    :cond_129
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_da

    .line 67
    :cond_156
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public static printTcx(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 7
    .param p0, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<TrainingCenterDatabase xsi:schemaLocation=\"\nhttp://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 \nhttp://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd\" \nxmlns:ns5=\"http://www.garmin.com/xmlschemas/ActivityGoals/v1\" \nxmlns:ns3=\"http://www.garmin.com/xmlschemas/ActivityExtension/v2\" \nxmlns:ns2=\"http://www.garmin.com/xmlschemas/UserProfile/v2\" \nxmlns=\"http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2\" \nxmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n<Activities>\n<Activity Sport=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    .line 82
    invoke-virtual {v1}, Lsergentum/export/core/Model$TrackSummary;->getActivityTypeDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\">\n<Id>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    iget-wide v2, v1, Lsergentum/export/core/Model$TrackSummary;->startTime:J

    .line 83
    invoke-static {v2, v3}, Lsergentum/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Id>\n<Lap StartTime=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    .line 84
    invoke-virtual {v1}, Lsergentum/export/core/Model$TrackSummary;->getStartTimeAsDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\">\n<TotalTimeSeconds>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    iget-wide v2, v1, Lsergentum/export/core/Model$TrackSummary;->endTime:J

    iget-object v1, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    iget-wide v4, v1, Lsergentum/export/core/Model$TrackSummary;->startTime:J

    sub-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</TotalTimeSeconds>\n<DistanceMeters>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    iget v1, v1, Lsergentum/export/core/Model$TrackSummary;->distance:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</DistanceMeters>\n<Track>\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 88
    invoke-static {p0}, Lsergentum/export/core/Printer;->printTcxPoints(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Track>\n</Lap>\n</Activity>\n</Activities>\n</TrainingCenterDatabase>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 71
    return-object v0
.end method

.method private static printTcxAltitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 124
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    if-eqz v0, :cond_22

    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<AltitudeMeters>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 126
    invoke-virtual {p0}, Lsergentum/export/core/Model$TrackPoint;->getAltitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</AltitudeMeters>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 128
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
    .line 142
    if-eqz p0, :cond_1c

    .line 143
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

    .line 146
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
    .line 132
    if-eqz p0, :cond_1c

    .line 133
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

    .line 138
    :goto_1b
    return-object v0

    :cond_1c
    const-string v0, ""

    goto :goto_1b
.end method

.method private static printTcxLatitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<LatitudeDegrees>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 104
    invoke-virtual {p0}, Lsergentum/export/core/Model$TrackPoint;->getLatitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</LatitudeDegrees>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 103
    return-object v0
.end method

.method private static printTcxLongitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<LongitudeDegrees>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 110
    invoke-virtual {p0}, Lsergentum/export/core/Model$TrackPoint;->getLongitudeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</LongitudeDegrees>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 109
    return-object v0
.end method

.method private static printTcxPoints(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 5
    .param p0, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 161
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 162
    .local v0, "stringBuilder":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lsergentum/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsergentum/export/core/Model$TrackPoint;

    .line 163
    .local v1, "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    invoke-static {v1}, Lsergentum/export/core/Printer;->printTcxTrackPoint(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b

    .line 165
    .end local v1    # "trackPoint":Lsergentum/export/core/Model$TrackPoint;
    :cond_1f
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static printTcxPosition(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 115
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    if-eqz v0, :cond_2e

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<Position>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 117
    invoke-static {p0}, Lsergentum/export/core/Printer;->printTcxLatitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 118
    invoke-static {p0}, Lsergentum/export/core/Printer;->printTcxLongitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Position>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 120
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
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<Time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 98
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Lsergentum/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 97
    return-object v0
.end method

.method private static printTcxTrackPoint(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;
    .registers 3
    .param p0, "trackPoint"    # Lsergentum/export/core/Model$TrackPoint;

    .prologue
    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<Trackpoint>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 151
    invoke-static {v1}, Lsergentum/export/core/Printer;->printTcxTime(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 152
    invoke-static {p0}, Lsergentum/export/core/Printer;->printTcxPosition(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 153
    invoke-static {p0}, Lsergentum/export/core/Printer;->printTcxAltitude(Lsergentum/export/core/Model$TrackPoint;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    .line 154
    invoke-static {v1}, Lsergentum/export/core/Printer;->printTcxHeartRate(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    .line 155
    invoke-static {v1}, Lsergentum/export/core/Printer;->printTcxCadence(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "</Trackpoint>\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 150
    return-object v0
.end method
