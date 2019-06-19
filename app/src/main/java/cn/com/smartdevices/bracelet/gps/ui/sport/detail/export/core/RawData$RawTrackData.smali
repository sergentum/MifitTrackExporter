.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;
.super Ljava/lang/Object;
.source "RawData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RawTrackData"
.end annotation


# instance fields
.field activityType:I

.field coordinates:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;",
            ">;"
        }
    .end annotation
.end field

.field costTime:I

.field distance:I

.field endTime:J

.field hrPoints:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public size:I

.field startTime:J

.field steps:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;",
            ">;"
        }
    .end annotation
.end field

.field times:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 198
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->times:Ljava/util/ArrayList;

    .line 199
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    .line 204
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    .line 206
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 15

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    .line 210
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .local v5, "stringBuilder":Ljava/lang/StringBuilder;
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "Start: %d"

    new-array v8, v13, [Ljava/lang/Object;

    iget-wide v10, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->startTime:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "Duration: %d"

    new-array v8, v13, [Ljava/lang/Object;

    iget v9, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->costTime:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "End: %d"

    new-array v8, v13, [Ljava/lang/Object;

    iget-wide v10, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->endTime:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "Type: %d"

    new-array v8, v13, [Ljava/lang/Object;

    iget v9, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->activityType:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v12

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    const-string v6, "\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    const-string v6, "Altitude"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    const-string v6, "Latitude"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    const-string v6, "Longitude"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    const-string v6, "Time"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    const-string v6, "HeartRate"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    const-string v6, "First"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    const-string v6, "Second"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    const-string v6, "Cadence"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    const-string v6, "Stride"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    const-string v6, "\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    iget-object v7, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-le v6, v7, :cond_19d

    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 230
    .local v3, "rowCount":I
    :goto_f4
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-le v3, v6, :cond_1a5

    .line 231
    :goto_fc
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_fd
    if-ge v2, v3, :cond_215

    .line 232
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_1ad

    .line 233
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;

    .line 234
    .local v0, "coordinate":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;
    iget-wide v6, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;->altitude:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    iget-wide v6, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;->latitude:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    iget-wide v6, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;->longitude:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->times:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .end local v0    # "coordinate":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Coordinate;
    :goto_13f
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_1db

    .line 246
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->hrPoints:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 247
    .local v1, "hr":Ljava/lang/Integer;
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .end local v1    # "hr":Ljava/lang/Integer;
    :goto_158
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_1e8

    .line 253
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;

    .line 254
    .local v4, "step":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;
    iget v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->first:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    iget v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->second:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    iget v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->cadence:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 257
    iget v6, v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;->stride:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 264
    .end local v4    # "step":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Step;
    :goto_194
    const-string v6, "\r\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_fd

    .line 229
    .end local v2    # "i":I
    .end local v3    # "rowCount":I
    :cond_19d
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->steps:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    goto/16 :goto_f4

    .line 230
    .restart local v3    # "rowCount":I
    :cond_1a5
    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$RawTrackData;->coordinates:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v3

    goto/16 :goto_fc

    .line 239
    .restart local v2    # "i":I
    :cond_1ad
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_13f

    .line 249
    :cond_1db
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_158

    .line 259
    :cond_1e8
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ";"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_194

    .line 266
    :cond_215
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method
