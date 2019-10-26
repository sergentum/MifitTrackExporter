.class public Lsergentum/export/core/Model;
.super Ljava/lang/Object;
.source "Model.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lsergentum/export/core/Model$Track;,
        Lsergentum/export/core/Model$TrackSummary;,
        Lsergentum/export/core/Model$TrackPoint;,
        Lsergentum/export/core/Model$Step;,
        Lsergentum/export/core/Model$Coordinate;,
        Lsergentum/export/core/Model$ActivityType;
    }
.end annotation


# static fields
.field private static sport2desc:Ljava/util/HashMap;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lsergentum/export/core/Model$ActivityType;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lsergentum/export/core/Model;->sport2desc:Ljava/util/HashMap;

    .line 22
    sget-object v0, Lsergentum/export/core/Model;->sport2desc:Ljava/util/HashMap;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->CYCLING:Lsergentum/export/core/Model$ActivityType;

    const-string v2, "Cycling"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    sget-object v0, Lsergentum/export/core/Model;->sport2desc:Ljava/util/HashMap;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->WALKING:Lsergentum/export/core/Model$ActivityType;

    const-string v2, "Walking"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    sget-object v0, Lsergentum/export/core/Model;->sport2desc:Ljava/util/HashMap;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->TREADMILL:Lsergentum/export/core/Model$ActivityType;

    const-string v2, "Treadmill"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    sget-object v0, Lsergentum/export/core/Model;->sport2desc:Ljava/util/HashMap;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    const-string v2, "Running"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/Long;I)Ljava/lang/String;
    .registers 3
    .param p0, "x0"    # Ljava/lang/Long;
    .param p1, "x1"    # I

    .prologue
    .line 17
    invoke-static {p0, p1}, Lsergentum/export/core/Model;->formatNullableNumberAsString(Ljava/lang/Long;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100()Ljava/util/HashMap;
    .registers 1

    .prologue
    .line 17
    sget-object v0, Lsergentum/export/core/Model;->sport2desc:Ljava/util/HashMap;

    return-object v0
.end method

.method private static formatNullableNumberAsString(Ljava/lang/Long;I)Ljava/lang/String;
    .registers 8
    .param p0, "number"    # Ljava/lang/Long;
    .param p1, "decimalPlace"    # I

    .prologue
    .line 133
    const-string v2, ""

    .line 134
    .local v2, "result":Ljava/lang/String;
    if-eqz p0, :cond_34

    .line 135
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 136
    .local v1, "lonString":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 137
    .local v0, "lonL":I
    if-lez v0, :cond_35

    if-le v0, p1, :cond_35

    .line 138
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    sub-int v5, v0, p1

    invoke-virtual {v1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sub-int v4, v0, p1

    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 143
    .end local v0    # "lonL":I
    .end local v1    # "lonString":Ljava/lang/String;
    .end local v2    # "result":Ljava/lang/String;
    :cond_34
    :goto_34
    return-object v2

    .line 140
    .restart local v0    # "lonL":I
    .restart local v1    # "lonString":Ljava/lang/String;
    .restart local v2    # "result":Ljava/lang/String;
    :cond_35
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Number format went wrong with number: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " and decimal place : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_34
.end method

.method static formatTimestamp(J)Ljava/lang/String;
    .registers 6
    .param p0, "timestamp"    # J

    .prologue
    .line 37
    new-instance v0, Ljava/util/Date;

    const-wide/16 v2, 0x3e8

    mul-long/2addr v2, p0

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 38
    .local v0, "date":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 39
    .local v1, "yyyyMMddTHHmmssSDF":Ljava/text/SimpleDateFormat;
    const-string v2, "UTC"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 40
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static formatTimestampHumanReadable(J)Ljava/lang/String;
    .registers 6
    .param p0, "timestamp"    # J

    .prologue
    .line 44
    new-instance v0, Ljava/util/Date;

    const-wide/16 v2, 0x3e8

    mul-long/2addr v2, p0

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 45
    .local v0, "date":Ljava/util/Date;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "yyyy-MM-dd_HH-mm"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 46
    .local v1, "yyyyMMddTHHmmssSDF":Ljava/text/SimpleDateFormat;
    const-string v2, "UTC"

    invoke-static {v2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 47
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
