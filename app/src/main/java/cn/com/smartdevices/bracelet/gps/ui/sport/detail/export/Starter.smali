.class public abstract Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
.super Ljava/lang/Object;
.source "Starter.java"


# static fields
.field static final EXT_DB_NAME:Ljava/lang/String; = "origin.db"

.field public static final TAG:Ljava/lang/String; = "mifit"

.field static final TRACK_DATA_QUERY:Ljava/lang/String; = "SELECT TRACKDATA.TRACKID,TRACKDATA.SIZE,TRACKDATA.BULKLL,TRACKDATA.BULKGAIT,TRACKDATA.BULKAL,TRACKDATA.BULKTIME,TRACKDATA.BULKHR,TRACKDATA.BULKPACE,TRACKDATA.BULKPAUSE,TRACKDATA.BULKSPEED,TRACKDATA.TYPE,TRACKDATA.BULKFLAG,TRACKRECORD.COSTTIME,TRACKRECORD.ENDTIME, TRACKRECORD.DISTANCE FROM TRACKDATA, TRACKRECORD WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID AND TRACKDATA.TRACKID = "

.field static final TRACK_ID_QUERY:Ljava/lang/String; = "   SELECT        TRACKRECORD.TRACKID,       TRACKDATA.TYPE,       TRACKRECORD.DISTANCE,       TRACKRECORD.COSTTIME       FROM TRACKDATA, TRACKRECORD       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static mapRawDataToQueryData(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "queryData"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    .param p1, "columnName"    # Ljava/lang/String;
    .param p2, "columnValue"    # Ljava/lang/String;

    .prologue
    .line 127
    if-eqz p2, :cond_c

    .line 128
    const-string v0, "TRACKID"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 129
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->startTime:Ljava/lang/String;

    .line 156
    :cond_c
    :goto_c
    return-void

    .line 130
    :cond_d
    const-string v0, "ENDTIME"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    .line 131
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->endTime:Ljava/lang/String;

    goto :goto_c

    .line 132
    :cond_18
    const-string v0, "COSTTIME"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 133
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->costTime:Ljava/lang/String;

    goto :goto_c

    .line 134
    :cond_23
    const-string v0, "SIZE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 135
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->size:Ljava/lang/String;

    goto :goto_c

    .line 136
    :cond_2e
    const-string v0, "TYPE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_39

    .line 137
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->activityType:Ljava/lang/String;

    goto :goto_c

    .line 138
    :cond_39
    const-string v0, "DISTANCE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 139
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->distance:Ljava/lang/String;

    goto :goto_c

    .line 140
    :cond_44
    const-string v0, "BULKLL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 141
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKLL:Ljava/lang/String;

    goto :goto_c

    .line 142
    :cond_4f
    const-string v0, "BULKGAIT"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 143
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKGAIT:Ljava/lang/String;

    goto :goto_c

    .line 144
    :cond_5a
    const-string v0, "BULKAL"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_65

    .line 145
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKAL:Ljava/lang/String;

    goto :goto_c

    .line 146
    :cond_65
    const-string v0, "BULKTIME"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_70

    .line 147
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKTIME:Ljava/lang/String;

    goto :goto_c

    .line 148
    :cond_70
    const-string v0, "BULKHR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_83

    .line 149
    const-string v0, ";,"

    const-string v1, ";1,"

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKHR:Ljava/lang/String;

    goto :goto_c

    .line 150
    :cond_83
    const-string v0, "BULKPACE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8f

    .line 151
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKPACE:Ljava/lang/String;

    goto/16 :goto_c

    .line 152
    :cond_8f
    const-string v0, "BULKFLAG"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 153
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKFLAG:Ljava/lang/String;

    goto/16 :goto_c
.end method


# virtual methods
.method checkIfPathExistAndCreate(Ljava/lang/String;)Z
    .registers 11
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 100
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 102
    .local v3, "path":Ljava/io/File;
    const-string v6, "."

    invoke-virtual {p1, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1d

    .line 104
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 105
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    .line 106
    .local v2, "parent":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    .end local v3    # "path":Ljava/io/File;
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 109
    .end local v0    # "file":Ljava/io/File;
    .end local v2    # "parent":Ljava/lang/String;
    .restart local v3    # "path":Ljava/io/File;
    :cond_1d
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3e

    .line 110
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

    invoke-virtual {p0, v6}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 123
    :goto_3d
    return v4

    .line 113
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

    invoke-virtual {p0, v6}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 114
    invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

    move-result v6

    if-eqz v6, :cond_79

    .line 115
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

    invoke-virtual {p0, v6}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    goto :goto_3d

    .line 118
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

    .line 119
    .local v1, "msg":Ljava/lang/String;
    new-array v4, v4, [Ljava/lang/String;

    aput-object v1, v4, v5

    invoke-virtual {p0, v4}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 120
    invoke-virtual {p0, v1, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->showToast(Ljava/lang/String;I)V

    move v4, v5

    .line 123
    goto :goto_3d
.end method

.method public abstract loadTrackHeadersFromDb()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;",
            ">;"
        }
    .end annotation
.end method

.method public log(Ljava/lang/String;Ljava/lang/Exception;)Z
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 76
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p2}, Ljava/lang/Exception;->printStackTrace()V

    .line 78
    const/4 v0, 0x1

    return v0
.end method

.method public varargs log([Ljava/lang/String;)Z
    .registers 4
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->stringArrayToString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "s":Ljava/lang/String;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    const/4 v1, 0x1

    return v1
.end method

.method public abstract readRawDataWithId(J)V
.end method

.method public showToast(Ljava/lang/String;I)V
    .registers 3
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 84
    return-void
.end method

.method public abstract showTracks()V
.end method

.method varargs stringArrayToString([Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    .line 58
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .local v5, "stringBuilder":Ljava/lang/StringBuilder;
    const-string v2, "yyyy-MM-dd_HH:mm:ss.SSSZ"

    .line 60
    .local v2, "pattern":Ljava/lang/String;
    new-instance v4, Ljava/text/SimpleDateFormat;

    invoke-direct {v4, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 61
    .local v4, "simpleDateFormat":Ljava/text/SimpleDateFormat;
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v4, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 63
    .local v1, "date":Ljava/lang/String;
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    array-length v7, p1

    const/4 v6, 0x0

    :goto_20
    if-ge v6, v7, :cond_38

    aget-object v0, p1, v6

    .line 65
    .local v0, "arg":Ljava/lang/String;
    if-eqz v0, :cond_34

    .line 66
    const-string v8, "\n"

    const-string v9, " @ "

    invoke-virtual {v0, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    .line 67
    .local v3, "replace":Ljava/lang/String;
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .end local v3    # "replace":Ljava/lang/String;
    :goto_31
    add-int/lit8 v6, v6, 0x1

    goto :goto_20

    .line 69
    :cond_34
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_31

    .line 72
    .end local v0    # "arg":Ljava/lang/String;
    :cond_38
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 9
    .param p1, "output"    # Ljava/lang/String;
    .param p2, "fileName"    # Ljava/lang/String;

    .prologue
    .line 87
    invoke-virtual {p0, p2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    .line 89
    :try_start_3
    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, p2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_8} :catch_1a

    .local v1, "fileWriter":Ljava/io/FileWriter;
    const/4 v4, 0x0

    .line 90
    :try_start_9
    invoke-virtual {v1, p1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_c} :catch_24
    .catchall {:try_start_9 .. :try_end_c} :catchall_26

    .line 91
    const/4 v2, 0x1

    .line 92
    .local v2, "result":Z
    if-eqz v1, :cond_14

    if-eqz v4, :cond_20

    :try_start_11
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_14} :catch_15
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_14} :catch_1a

    .line 96
    .end local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_14
    :goto_14
    return v2

    .line 92
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

    .line 93
    .local v0, "ex":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 94
    const/4 v2, 0x0

    .restart local v2    # "result":Z
    goto :goto_14

    .line 92
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_20
    :try_start_20
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_23
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_23} :catch_1a

    goto :goto_14

    .line 89
    .end local v2    # "result":Z
    :catch_24
    move-exception v4

    :try_start_25
    throw v4
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_26

    .line 92
    :catchall_26
    move-exception v3

    if-eqz v1, :cond_2e

    if-eqz v4, :cond_34

    :try_start_2b
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_2e
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2e} :catch_2f
    .catch Ljava/io/IOException; {:try_start_2b .. :try_end_2e} :catch_1a

    :cond_2e
    :goto_2e
    :try_start_2e
    throw v3

    :catch_2f
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2e

    :cond_34
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_37} :catch_1a

    goto :goto_2e
.end method
