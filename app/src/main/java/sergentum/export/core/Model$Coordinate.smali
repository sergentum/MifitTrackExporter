.class Lsergentum/export/core/Model$Coordinate;
.super Ljava/lang/Object;
.source "Model.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsergentum/export/core/Model;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Coordinate"
.end annotation


# instance fields
.field altitude:J

.field latitude:J

.field longitude:J


# direct methods
.method constructor <init>(JJJ)V
    .registers 8
    .param p1, "latitude"    # J
    .param p3, "longitude"    # J
    .param p5, "altitude"    # J

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput-wide p1, p0, Lsergentum/export/core/Model$Coordinate;->latitude:J

    .line 57
    iput-wide p3, p0, Lsergentum/export/core/Model$Coordinate;->longitude:J

    .line 58
    iput-wide p5, p0, Lsergentum/export/core/Model$Coordinate;->altitude:J

    .line 59
    return-void
.end method
