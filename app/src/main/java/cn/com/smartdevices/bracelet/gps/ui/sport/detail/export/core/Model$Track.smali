.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;
.super Ljava/lang/Object;
.source "Model.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Track"
.end annotation


# instance fields
.field activityType:I

.field distance:I

.field duration:J

.field endTime:J

.field size:I

.field startTime:J

.field trackPoints:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 180
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    return-void
.end method

.method private getEndTimeAsDate()Ljava/lang/String;
    .registers 3

    .prologue
    .line 187
    iget-wide v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->endTime:J

    invoke-static {v0, v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private printTrackPoints()Ljava/lang/String;
    .registers 6

    .prologue
    .line 195
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .local v0, "stringBuffer":Ljava/lang/StringBuilder;
    const-string v2, "size:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    iget-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_42

    .line 198
    const-string v2, "\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    iget-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->trackPoints:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_27
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;

    .line 200
    .local v1, "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_27

    .line 202
    .end local v1    # "trackPoint":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackPoint;
    :cond_3d
    const-string v2, "\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    :cond_42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method getActivityTypeDescription()Ljava/lang/String;
    .registers 2

    .prologue
    .line 191
    iget v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->activityType:I

    invoke-static {v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->access$000(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getStartTimeAsDate()Ljava/lang/String;
    .registers 3

    .prologue
    .line 183
    iget-wide v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->startTime:J

    invoke-static {v0, v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 209
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Track{id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->startTime:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", duration="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->duration:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->size:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", startTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 213
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->getStartTimeAsDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", endTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 214
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->getEndTimeAsDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", type=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 215
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->getActivityTypeDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", points: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 216
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$Track;->printTrackPoints()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 209
    return-object v0
.end method
