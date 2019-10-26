.class public Lsergentum/export/core/Model$TrackPoint;
.super Ljava/lang/Object;
.source "Model.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsergentum/export/core/Model;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TrackPoint"
.end annotation


# instance fields
.field altitude:Ljava/lang/Long;

.field cadence:Ljava/lang/Integer;

.field heartRate:Ljava/lang/Integer;

.field latitude:Ljava/lang/Long;

.field longitude:Ljava/lang/Long;

.field pace:Ljava/lang/Integer;

.field stride:Ljava/lang/Integer;

.field timestamp:Ljava/lang/Long;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getAltitudeString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 112
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lsergentum/export/core/Model;->access$000(Ljava/lang/Long;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCadenceString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_f

    .line 125
    :cond_c
    const-string v0, ""

    .line 127
    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method public getHeartRateString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 116
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_f

    .line 117
    :cond_c
    const-string v0, ""

    .line 119
    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_e
.end method

.method getLatitudeString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 104
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lsergentum/export/core/Model;->access$000(Ljava/lang/Long;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getLongitudeString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 108
    iget-object v0, p0, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lsergentum/export/core/Model;->access$000(Ljava/lang/Long;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TrackPoint{timestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", dateTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->timestamp:Ljava/lang/Long;

    .line 92
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v2, v3}, Lsergentum/export/core/Model;->formatTimestamp(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", heartRate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->heartRate:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", latitude="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->latitude:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", longitude="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->longitude:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", altitude="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->altitude:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", pace="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->pace:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", cadence="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/export/core/Model$TrackPoint;->cadence:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 90
    return-object v0
.end method
