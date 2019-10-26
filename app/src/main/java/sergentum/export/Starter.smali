.class public abstract Lsergentum/export/Starter;
.super Ljava/lang/Object;
.source "Starter.java"


# static fields
.field public static final COMMA:Ljava/lang/String; = ","

.field public static final CSV_COLUMN_DELIMITER:Ljava/lang/String; = ";"

.field public static final DEBUG_LOG_FILE:Ljava/lang/String; = "log.txt"

.field public static final DEBUG_OUT_PATH:Ljava/lang/String; = "debug/"

.field public static DEVICE_PATH:Ljava/lang/String; = null

.field public static final EMPTY_VALUE:Ljava/lang/String; = "-"

.field public static EXPORT_PATH:Ljava/lang/String; = null

.field static final EXT_DB_NAME:Ljava/lang/String; = "origin.db"

.field public static FILE_FORMAT:Ljava/lang/String; = null

.field public static final GPX_EXT:Ljava/lang/String; = ".gpx"

.field public static final RAW_CSV:Ljava/lang/String; = "-raw.csv"

.field public static final SEMICOLON:Ljava/lang/String; = ";"

.field public static final TAG:Ljava/lang/String; = "mifit"

.field public static final TCX_EXT:Ljava/lang/String; = ".tcx"

.field static final TRACK_DATA_QUERY:Ljava/lang/String; = "SELECT TRACKDATA.TRACKID,TRACKDATA.SIZE,TRACKDATA.BULKLL,TRACKDATA.BULKGAIT,TRACKDATA.BULKAL,TRACKDATA.BULKTIME,TRACKDATA.BULKHR,TRACKDATA.BULKPACE,TRACKDATA.BULKPAUSE,TRACKDATA.BULKSPEED,TRACKDATA.TYPE,TRACKDATA.BULKFLAG,TRACKRECORD.COSTTIME,TRACKRECORD.ENDTIME, TRACKRECORD.DISTANCE FROM TRACKDATA, TRACKRECORD WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID AND TRACKDATA.TRACKID = "

.field static final TRACK_ID_QUERY:Ljava/lang/String; = "   SELECT        TRACKRECORD.TRACKID,       TRACKDATA.TYPE,       TRACKRECORD.DISTANCE,       TRACKRECORD.COSTTIME       FROM TRACKDATA, TRACKRECORD       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;"

.field static debug:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 28
    const-string v0, ""

    sput-object v0, Lsergentum/export/Starter;->DEVICE_PATH:Ljava/lang/String;

    .line 31
    const-string v0, "Android/Mifit/"

    sput-object v0, Lsergentum/export/Starter;->EXPORT_PATH:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static generateFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 7
    .param p0, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 148
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s_%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    iget-wide v4, v4, Lsergentum/export/core/Model$TrackSummary;->startTime:J

    .line 149
    invoke-static {v4, v5}, Lsergentum/export/core/Model;->formatTimestampHumanReadable(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    iget v4, v4, Lsergentum/export/core/Model$TrackSummary;->distance:I

    .line 150
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    .line 148
    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDebugPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lsergentum/export/Starter;->DEVICE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lsergentum/export/Starter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "debug/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getFullPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lsergentum/export/Starter;->DEVICE_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lsergentum/export/Starter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static mapRawDataToQueryData(Lsergentum/export/core/RawData$QueryData;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "queryData"    # Lsergentum/export/core/RawData$QueryData;
    .param p1, "columnName"    # Ljava/lang/String;
    .param p2, "columnValue"    # Ljava/lang/String;

    .prologue
    .line 181
    if-eqz p2, :cond_c

    .line 182
    const-string v0, "TRACKID"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 183
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->startTime:Ljava/lang/String;

    .line 210
    :cond_c
    :goto_c
    return-void

    .line 184
    :cond_d
    const-string v0, "ENDTIME"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 185
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->endTime:Ljava/lang/String;

    goto :goto_c

    .line 186
    :cond_18
    const-string v0, "COSTTIME"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 187
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->costTime:Ljava/lang/String;

    goto :goto_c

    .line 188
    :cond_23
    const-string v0, "SIZE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 189
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->size:Ljava/lang/String;

    goto :goto_c

    .line 190
    :cond_2e
    const-string v0, "TYPE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 191
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->activityType:Ljava/lang/String;

    goto :goto_c

    .line 192
    :cond_39
    const-string v0, "DISTANCE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 193
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->distance:Ljava/lang/String;

    goto :goto_c

    .line 194
    :cond_44
    const-string v0, "BULKLL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 195
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->BULKLL:Ljava/lang/String;

    goto :goto_c

    .line 196
    :cond_4f
    const-string v0, "BULKGAIT"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 197
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->BULKGAIT:Ljava/lang/String;

    goto :goto_c

    .line 198
    :cond_5a
    const-string v0, "BULKAL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_65

    .line 199
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->BULKAL:Ljava/lang/String;

    goto :goto_c

    .line 200
    :cond_65
    const-string v0, "BULKTIME"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 201
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->BULKTIME:Ljava/lang/String;

    goto :goto_c

    .line 202
    :cond_70
    const-string v0, "BULKHR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_83

    .line 203
    const-string v0, ";,"

    const-string v1, ";1,"

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lsergentum/export/core/RawData$QueryData;->BULKHR:Ljava/lang/String;

    goto :goto_c

    .line 204
    :cond_83
    const-string v0, "BULKPACE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8f

    .line 205
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->BULKPACE:Ljava/lang/String;

    goto/16 :goto_c

    .line 206
    :cond_8f
    const-string v0, "BULKFLAG"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 207
    iput-object p2, p0, Lsergentum/export/core/RawData$QueryData;->BULKFLAG:Ljava/lang/String;

    goto/16 :goto_c
.end method


# virtual methods
.method checkIfPathExistAndCreate(Ljava/lang/String;)Z
    .registers 11
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 154
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 156
    .local v3, "path":Ljava/io/File;
    const-string v6, "."

    invoke-virtual {p1, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1d

    .line 158
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 159
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    .line 160
    .local v2, "parent":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    .end local v3    # "path":Ljava/io/File;
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 163
    .end local v0    # "file":Ljava/io/File;
    .end local v2    # "parent":Ljava/lang/String;
    .restart local v3    # "path":Ljava/io/File;
    :cond_1d
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3e

    .line 164
    new-array v6, v4, [Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "path exists:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v5

    invoke-virtual {p0, v6}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 177
    :goto_3d
    return v4

    .line 167
    :cond_3e
    new-array v6, v4, [Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "path doesn\'t exists:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v5

    invoke-virtual {p0, v6}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 168
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v6

    if-eqz v6, :cond_79

    .line 169
    new-array v6, v4, [Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "path created:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v5

    invoke-virtual {p0, v6}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    goto :goto_3d

    .line 172
    :cond_79
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "path can\'t be created:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 173
    .local v1, "msg":Ljava/lang/String;
    new-array v4, v4, [Ljava/lang/String;

    aput-object v1, v4, v5

    invoke-virtual {p0, v4}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 174
    invoke-virtual {p0, v1, v5}, Lsergentum/export/Starter;->showToast(Ljava/lang/String;I)V

    move v4, v5

    .line 177
    goto :goto_3d
.end method

.method exportGPX(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 7
    .param p1, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 132
    invoke-static {p1}, Lsergentum/export/Starter;->generateFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "fileName":Ljava/lang/String;
    invoke-static {p1}, Lsergentum/export/core/Printer;->printGpx(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "gpx":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/Starter;->getFullPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".gpx"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 135
    .local v2, "gpxFullPath":Ljava/lang/String;
    invoke-virtual {p0, v1, v2}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 136
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".gpx"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method exportTCX(Lsergentum/export/core/Model$Track;)Ljava/lang/String;
    .registers 7
    .param p1, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 140
    invoke-static {p1}, Lsergentum/export/Starter;->generateFileName(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "fileName":Ljava/lang/String;
    invoke-static {p1}, Lsergentum/export/core/Printer;->printTcx(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v1

    .line 142
    .local v1, "tcx":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/Starter;->getFullPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".tcx"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 143
    .local v2, "tcxFullPath":Ljava/lang/String;
    invoke-virtual {p0, v1, v2}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 144
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".tcx"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getDebug()Ljava/lang/Boolean;
    .registers 2

    .prologue
    .line 213
    sget-object v0, Lsergentum/export/Starter;->debug:Ljava/lang/Boolean;

    return-object v0
.end method

.method public abstract loadTrackSummaryFromDb()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lsergentum/export/core/Model$TrackSummary;",
            ">;"
        }
    .end annotation
.end method

.method public log(Ljava/lang/String;Ljava/lang/Exception;)Z
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 108
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 109
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 110
    const/4 v0, 0x1

    return v0
.end method

.method public varargs log([Ljava/lang/String;)Z
    .registers 4
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Lsergentum/export/Starter;->stringArrayToString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 85
    .local v0, "s":Ljava/lang/String;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 86
    const/4 v1, 0x1

    return v1
.end method

.method public abstract readRawDataWithId(J)Lsergentum/export/core/RawData$QueryData;
.end method

.method public showToast(Ljava/lang/String;I)V
    .registers 6
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 115
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "toast:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 116
    return-void
.end method

.method public abstract showTracks()V
.end method

.method varargs stringArrayToString([Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 90
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .local v5, "stringBuilder":Ljava/lang/StringBuilder;
    const-string v2, "yyyy-MM-dd_HH:mm:ss.SSSZ"

    .line 92
    .local v2, "pattern":Ljava/lang/String;
    new-instance v4, Ljava/text/SimpleDateFormat;

    invoke-direct {v4, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 93
    .local v4, "simpleDateFormat":Ljava/text/SimpleDateFormat;
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "date":Ljava/lang/String;
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    array-length v7, p1

    const/4 v6, 0x0

    :goto_20
    if-ge v6, v7, :cond_3a

    aget-object v0, p1, v6

    .line 97
    .local v0, "arg":Ljava/lang/String;
    if-eqz v0, :cond_34

    .line 98
    const-string v8, "\n"

    const-string v9, " @ "

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 99
    .local v3, "replace":Ljava/lang/String;
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .end local v3    # "replace":Ljava/lang/String;
    :goto_31
    add-int/lit8 v6, v6, 0x1

    goto :goto_20

    .line 101
    :cond_34
    const-string v8, " null "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_31

    .line 104
    .end local v0    # "arg":Ljava/lang/String;
    :cond_3a
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 9
    .param p1, "output"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 119
    invoke-virtual {p0, p2}, Lsergentum/export/Starter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    .line 121
    :try_start_3
    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, p2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_8} :catch_1a

    .local v1, "fileWriter":Ljava/io/FileWriter;
    const/4 v4, 0x0

    .line 122
    :try_start_9
    invoke-virtual {v1, p1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_c} :catch_2e
    .catchall {:try_start_9 .. :try_end_c} :catchall_30

    .line 123
    const/4 v2, 0x1

    .line 124
    .local v2, "result":Z
    if-eqz v1, :cond_14

    if-eqz v4, :cond_2a

    :try_start_11
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_14} :catch_15
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_14} :catch_1a

    .line 128
    .end local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_14
    :goto_14
    return v2

    .line 124
    .restart local v1    # "fileWriter":Ljava/io/FileWriter;
    :catch_15
    move-exception v3

    :try_start_16
    invoke-virtual {v4, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_19} :catch_1a

    goto :goto_14

    .end local v1    # "fileWriter":Ljava/io/FileWriter;
    .end local v2    # "result":Z
    :catch_1a
    move-exception v0

    .line 125
    .local v0, "ex":Ljava/io/IOException;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {p0, v3}, Lsergentum/export/Starter;->log([Ljava/lang/String;)Z

    .line 126
    const/4 v2, 0x0

    .restart local v2    # "result":Z
    goto :goto_14

    .line 124
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_2a
    :try_start_2a
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_2d
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2d} :catch_1a

    goto :goto_14

    .line 121
    .end local v2    # "result":Z
    :catch_2e
    move-exception v4

    :try_start_2f
    throw v4
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_30

    .line 124
    :catchall_30
    move-exception v3

    if-eqz v1, :cond_38

    if-eqz v4, :cond_3e

    :try_start_35
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_35 .. :try_end_38} :catch_39
    .catch Ljava/io/IOException; {:try_start_35 .. :try_end_38} :catch_1a

    :cond_38
    :goto_38
    :try_start_38
    throw v3

    :catch_39
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_38

    :cond_3e
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_41
    .catch Ljava/io/IOException; {:try_start_38 .. :try_end_41} :catch_1a

    goto :goto_38
.end method
