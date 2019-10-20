.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;
.super Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
.source "MifitStarter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;
    }
.end annotation


# static fields
.field private static final TMP_DB_QUERY:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS dummy (\"_id\"  INTEGER primary key autoincrement, \n  \"CALENDAR\" INTEGER )"

.field private static final TRACK_DATA_QUERY:Ljava/lang/String; = "SELECT TRACKDATA.TRACKID,TRACKDATA.SIZE,TRACKDATA.BULKLL,TRACKDATA.BULKGAIT,TRACKDATA.BULKAL,TRACKDATA.BULKTIME,TRACKDATA.BULKHR,TRACKDATA.BULKPACE,TRACKDATA.BULKPAUSE,TRACKDATA.BULKSPEED,TRACKDATA.TYPE,TRACKDATA.BULKFLAG,TRACKRECORD.COSTTIME,TRACKRECORD.ENDTIME, TRACKRECORD.DISTANCE FROM TRACKDATA, TRACKRECORD WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID AND TRACKDATA.TRACKID = "

.field public static final TRACK_ID_QUERY:Ljava/lang/String; = "   SELECT        TRACKRECORD.TRACKID,       TRACKDATA.TYPE,       TRACKRECORD.DISTANCE,       TRACKRECORD.COSTTIME       FROM TRACKDATA, TRACKRECORD       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;"


# instance fields
.field private activity:Landroid/app/Activity;

.field private dbPath:Ljava/lang/String;

.field private logFilePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x0

    .line 69
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;-><init>()V

    .line 70
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->DEVICE_PATH:Ljava/lang/String;

    .line 72
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 73
    .local v1, "sp":Landroid/content/SharedPreferences;
    const-string v2, "export_format"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->FILE_FORMAT:Ljava/lang/String;

    .line 74
    const-string v2, "debug"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    sput-boolean v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->debug:Z

    .line 77
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 79
    .local v0, "language":Ljava/lang/String;
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->checkFilePath()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 80
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->getDbPath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->dbPath:Ljava/lang/String;

    .line 85
    :goto_4c
    return-void

    .line 82
    :cond_4d
    const-string v2, "can\'t get access to filesystem"

    invoke-static {p1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 83
    const-string v2, "mifit"

    const-string v3, "can\'t get access to filesystem"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4c
.end method

.method static synthetic access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;J)V
    .registers 4
    .param p0, "x0"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;
    .param p1, "x1"    # J

    .prologue
    .line 30
    invoke-direct {p0, p1, p2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->readRawDataWithId(J)V

    return-void
.end method

.method private checkExtDb()Ljava/lang/String;
    .registers 14

    .prologue
    const/4 v12, 0x1

    const/4 v8, 0x0

    .line 211
    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v5

    .line 212
    .local v5, "mifit_dir_path":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    .line 213
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 214
    .local v4, "mifit_dir":Ljava/io/File;
    new-array v7, v12, [Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "search for ext db in:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 215
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_a9

    .line 217
    :try_start_2e
    invoke-virtual {v4}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v3

    .line 218
    .local v3, "list":[Ljava/lang/String;
    array-length v9, v3

    move v7, v8

    :goto_34
    if-ge v7, v9, :cond_a9

    aget-object v2, v3, v7

    .line 219
    .local v2, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .local v0, "curFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-nez v10, :cond_87

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    const-string v11, "origin.db"

    invoke-virtual {v10, v11}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_87

    .line 221
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 222
    .local v6, "result":Ljava/lang/String;
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v9, 0x0

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "ext db found:"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v7, v9

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 223
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ext db found:"

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    invoke-virtual {p0, v7, v9}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->showToast(Ljava/lang/String;I)V
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_86} :catch_8a

    .line 232
    .end local v0    # "curFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "list":[Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    :goto_86
    return-object v6

    .line 218
    .restart local v0    # "curFile":Ljava/io/File;
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "list":[Ljava/lang/String;
    :cond_87
    add-int/lit8 v7, v7, 0x1

    goto :goto_34

    .line 227
    .end local v0    # "curFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "list":[Ljava/lang/String;
    :catch_8a
    move-exception v1

    .line 228
    .local v1, "ex":Ljava/lang/Exception;
    new-array v7, v12, [Ljava/lang/String;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "checkExtDb():"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 231
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_a9
    new-array v7, v12, [Ljava/lang/String;

    const-string v9, "ext db not found"

    aput-object v9, v7, v8

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 232
    const/4 v6, 0x0

    goto :goto_86
.end method

.method private checkFilePath()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 269
    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getDebugPath()Ljava/lang/String;

    move-result-object v0

    .line 270
    .local v0, "filePath":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 271
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "log.txt"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->logFilePath:Ljava/lang/String;

    .line 272
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "."

    aput-object v3, v2, v1

    invoke-virtual {p0, v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    move-result v1

    .line 274
    :cond_2b
    return v1
.end method

.method private dbPathFinder()Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 259
    iget-object v3, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    const-string v4, "tmp.db"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v6, v5}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 260
    .local v0, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "CREATE TABLE IF NOT EXISTS dummy (\"_id\"  INTEGER primary key autoincrement, \n  \"CALENDAR\" INTEGER )"

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 261
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 262
    .local v2, "tmpDbPath":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 263
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 264
    .local v1, "tmpDb":Ljava/io/File;
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "origin db path:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p0, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 265
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private findOriginDb()Ljava/lang/String;
    .registers 16

    .prologue
    const/4 v14, 0x1

    const/4 v9, 0x0

    .line 236
    const-string v8, "^origin_db_[A-Za-z0-9]*$"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 238
    .local v7, "pattern":Ljava/util/regex/Pattern;
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->dbPathFinder()Ljava/lang/String;

    move-result-object v5

    .line 240
    .local v5, "pathToDb":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 241
    .local v2, "directory":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 243
    .local v4, "list":[Ljava/lang/String;
    array-length v10, v4

    move v8, v9

    :goto_17
    if-ge v8, v10, :cond_70

    aget-object v3, v4, v8

    .line 244
    .local v3, "file":Ljava/lang/String;
    invoke-virtual {v7, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    .line 245
    .local v1, "dbFound":Z
    new-array v11, v14, [Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "file:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " matches:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v11, v9

    invoke-virtual {p0, v11}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 246
    if-eqz v1, :cond_6d

    .line 247
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 248
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 249
    .local v6, "pathToOriginDb":Ljava/lang/String;
    new-array v8, v14, [Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "origin db found: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {p0, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 255
    .end local v0    # "dbFile":Ljava/io/File;
    .end local v1    # "dbFound":Z
    .end local v3    # "file":Ljava/lang/String;
    .end local v6    # "pathToOriginDb":Ljava/lang/String;
    :goto_6c
    return-object v6

    .line 243
    .restart local v1    # "dbFound":Z
    .restart local v3    # "file":Ljava/lang/String;
    :cond_6d
    add-int/lit8 v8, v8, 0x1

    goto :goto_17

    .line 254
    .end local v1    # "dbFound":Z
    .end local v3    # "file":Ljava/lang/String;
    :cond_70
    new-array v8, v14, [Ljava/lang/String;

    const-string v10, "origin db not found"

    aput-object v10, v8, v9

    invoke-virtual {p0, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 255
    const/4 v6, 0x0

    goto :goto_6c
.end method

.method private getDbPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 202
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->checkExtDb()Ljava/lang/String;

    move-result-object v0

    .line 203
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 204
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->findOriginDb()Ljava/lang/String;

    move-result-object v0

    .line 206
    :cond_a
    return-object v0
.end method

.method private readRawDataWithId(J)V
    .registers 20
    .param p1, "id"    # J

    .prologue
    .line 179
    :try_start_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->dbPath:Ljava/lang/String;

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v11, v12, v13, v14}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_81

    move-result-object v9

    .line 178
    .local v9, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v13, 0x0

    .line 180
    :try_start_f
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "SELECT TRACKDATA.TRACKID,TRACKDATA.SIZE,TRACKDATA.BULKLL,TRACKDATA.BULKGAIT,TRACKDATA.BULKAL,TRACKDATA.BULKTIME,TRACKDATA.BULKHR,TRACKDATA.BULKPACE,TRACKDATA.BULKPAUSE,TRACKDATA.BULKSPEED,TRACKDATA.TYPE,TRACKDATA.BULKFLAG,TRACKRECORD.COSTTIME,TRACKRECORD.ENDTIME, TRACKRECORD.DISTANCE FROM TRACKDATA, TRACKRECORD WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID AND TRACKDATA.TRACKID = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-wide/from16 v0, p1

    invoke-virtual {v11, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v9, v11, v12}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_28} :catch_73
    .catchall {:try_start_f .. :try_end_28} :catchall_b5

    move-result-object v4

    .line 178
    .local v4, "cursor":Landroid/database/Cursor;
    const/4 v12, 0x0

    .line 182
    :try_start_2a
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 183
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 184
    .local v8, "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v11

    if-nez v11, :cond_55

    .line 185
    new-instance v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;

    invoke-direct {v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;-><init>()V

    .line 186
    .local v7, "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3e
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnCount()I

    move-result v11

    if-ge v6, v11, :cond_52

    .line 187
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 188
    .local v3, "columnValue":Ljava/lang/String;
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    .line 189
    .local v2, "columnName":Ljava/lang/String;
    invoke-static {v7, v2, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->mapRawDataToQueryData(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    add-int/lit8 v6, v6, 0x1

    goto :goto_3e

    .line 191
    .end local v2    # "columnName":Ljava/lang/String;
    .end local v3    # "columnValue":Ljava/lang/String;
    :cond_52
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    .end local v6    # "i":I
    .end local v7    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    :cond_55
    new-instance v10, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;)V

    .line 194
    .local v10, "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    invoke-virtual {v10, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->launchExport(Ljava/util/ArrayList;)V
    :try_end_5f
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_5f} :catch_b8
    .catchall {:try_start_2a .. :try_end_5f} :catchall_e1

    .line 196
    if-eqz v4, :cond_66

    if-eqz v12, :cond_b1

    :try_start_63
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_66
    .catch Ljava/lang/Throwable; {:try_start_63 .. :try_end_66} :catch_6e
    .catchall {:try_start_63 .. :try_end_66} :catchall_b5

    :cond_66
    :goto_66
    if-eqz v9, :cond_6d

    if-eqz v13, :cond_d4

    :try_start_6a
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_6d
    .catch Ljava/lang/Throwable; {:try_start_6a .. :try_end_6d} :catch_cf
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_6d} :catch_81

    .line 199
    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :cond_6d
    :goto_6d
    return-void

    .line 196
    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .restart local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catch_6e
    move-exception v11

    :try_start_6f
    invoke-virtual {v12, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_72
    .catch Ljava/lang/Throwable; {:try_start_6f .. :try_end_72} :catch_73
    .catchall {:try_start_6f .. :try_end_72} :catchall_b5

    goto :goto_66

    .line 178
    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catch_73
    move-exception v11

    :try_start_74
    throw v11
    :try_end_75
    .catchall {:try_start_74 .. :try_end_75} :catchall_75

    .line 196
    :catchall_75
    move-exception v12

    move-object v15, v12

    move-object v12, v11

    move-object v11, v15

    :goto_79
    if-eqz v9, :cond_80

    if-eqz v12, :cond_dd

    :try_start_7d
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_80
    .catch Ljava/lang/Throwable; {:try_start_7d .. :try_end_80} :catch_d8
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_80} :catch_81

    :cond_80
    :goto_80
    :try_start_80
    throw v11
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_80 .. :try_end_81} :catch_81

    .end local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :catch_81
    move-exception v5

    .line 197
    .local v5, "e":Ljava/lang/Exception;
    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/String;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "readRawDataWithId("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-wide/from16 v0, p1

    invoke-virtual {v13, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "):"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v11, v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    goto :goto_6d

    .line 196
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .restart local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :cond_b1
    :try_start_b1
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_b4
    .catch Ljava/lang/Throwable; {:try_start_b1 .. :try_end_b4} :catch_73
    .catchall {:try_start_b1 .. :try_end_b4} :catchall_b5

    goto :goto_66

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catchall_b5
    move-exception v11

    move-object v12, v13

    goto :goto_79

    .line 178
    .restart local v4    # "cursor":Landroid/database/Cursor;
    :catch_b8
    move-exception v11

    :try_start_b9
    throw v11
    :try_end_ba
    .catchall {:try_start_b9 .. :try_end_ba} :catchall_ba

    .line 196
    :catchall_ba
    move-exception v12

    move-object v15, v12

    move-object v12, v11

    move-object v11, v15

    :goto_be
    if-eqz v4, :cond_c5

    if-eqz v12, :cond_cb

    :try_start_c2
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_c5
    .catch Ljava/lang/Throwable; {:try_start_c2 .. :try_end_c5} :catch_c6
    .catchall {:try_start_c2 .. :try_end_c5} :catchall_b5

    :cond_c5
    :goto_c5
    :try_start_c5
    throw v11

    :catch_c6
    move-exception v14

    invoke-virtual {v12, v14}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_c5

    :cond_cb
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_ce
    .catch Ljava/lang/Throwable; {:try_start_c5 .. :try_end_ce} :catch_73
    .catchall {:try_start_c5 .. :try_end_ce} :catchall_b5

    goto :goto_c5

    .restart local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .restart local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catch_cf
    move-exception v11

    :try_start_d0
    invoke-virtual {v13, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_6d

    :cond_d4
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_6d

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catch_d8
    move-exception v13

    invoke-virtual {v12, v13}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_80

    :cond_dd
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_e0
    .catch Ljava/lang/Exception; {:try_start_d0 .. :try_end_e0} :catch_81

    goto :goto_80

    .restart local v4    # "cursor":Landroid/database/Cursor;
    :catchall_e1
    move-exception v11

    goto :goto_be
.end method


# virtual methods
.method loadTrackHeadersFromDb()Ljava/util/Map;
    .registers 24
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

    .prologue
    .line 89
    new-instance v14, Ljava/util/TreeMap;

    invoke-direct {v14}, Ljava/util/TreeMap;-><init>()V

    .line 90
    .local v14, "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    move-object/from16 v0, p0

    iget-object v15, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->dbPath:Ljava/lang/String;

    if-nez v15, :cond_1f

    .line 91
    move-object/from16 v0, p0

    iget-object v15, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    const-string v18, "database not found"

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v15, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v15

    invoke-virtual {v15}, Landroid/widget/Toast;->show()V

    .line 127
    :cond_1e
    :goto_1e
    return-object v14

    .line 95
    :cond_1f
    :try_start_1f
    move-object/from16 v0, p0

    iget-object v15, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->dbPath:Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v15, v0, v1, v2}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_36} :catch_e1

    move-result-object v10

    .line 94
    .local v10, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const/16 v19, 0x0

    .line 96
    :try_start_39
    const-string v15, "   SELECT        TRACKRECORD.TRACKID,       TRACKDATA.TYPE,       TRACKRECORD.DISTANCE,       TRACKRECORD.COSTTIME       FROM TRACKDATA, TRACKRECORD       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;"

    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v10, v15, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_42
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_42} :catch_d0
    .catchall {:try_start_39 .. :try_end_42} :catchall_13c

    move-result-object v4

    .line 94
    .local v4, "cursor":Landroid/database/Cursor;
    const/16 v18, 0x0

    .line 98
    :try_start_45
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 99
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 100
    .local v12, "stringBuilder":Ljava/lang/StringBuilder;
    :goto_4d
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v15

    if-nez v15, :cond_107

    .line 101
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_54
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnCount()I

    move-result v15

    if-ge v7, v15, :cond_8c

    .line 102
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v20, " "

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    if-nez v7, :cond_89

    .line 104
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 105
    .local v11, "string":Ljava/lang/String;
    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 106
    .local v8, "l":J
    new-instance v5, Ljava/util/Date;

    const-wide/16 v20, 0x3e8

    mul-long v20, v20, v8

    move-wide/from16 v0, v20

    invoke-direct {v5, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 107
    .local v5, "date":Ljava/util/Date;
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v20, " "

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .end local v5    # "date":Ljava/util/Date;
    .end local v8    # "l":J
    .end local v11    # "string":Ljava/lang/String;
    :cond_89
    add-int/lit8 v7, v7, 0x1

    goto :goto_54

    .line 110
    :cond_8c
    const-string v15, "\n"

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    new-instance v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;

    invoke-direct {v13}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;-><init>()V

    .line 113
    .local v13, "trackHeader":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;
    const/4 v15, 0x0

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 114
    .local v16, "trackId":J
    move-wide/from16 v0, v16

    iput-wide v0, v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->id:J

    .line 115
    const/4 v15, 0x1

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    iput v15, v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->type:I

    .line 116
    const/4 v15, 0x2

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    iput v15, v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->distance:I

    .line 117
    const/4 v15, 0x3

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    iput v15, v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->duration:I

    .line 118
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    invoke-interface {v14, v15, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_be
    .catch Ljava/lang/Throwable; {:try_start_45 .. :try_end_be} :catch_bf
    .catchall {:try_start_45 .. :try_end_be} :catchall_160

    goto :goto_4d

    .line 94
    .end local v7    # "i":I
    .end local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v13    # "trackHeader":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;
    .end local v16    # "trackId":J
    :catch_bf
    move-exception v15

    :try_start_c0
    throw v15
    :try_end_c1
    .catchall {:try_start_c0 .. :try_end_c1} :catchall_c1

    .line 124
    :catchall_c1
    move-exception v18

    move-object/from16 v22, v18

    move-object/from16 v18, v15

    move-object/from16 v15, v22

    :goto_c8
    if-eqz v4, :cond_cf

    if-eqz v18, :cond_14d

    :try_start_cc
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_cf
    .catch Ljava/lang/Throwable; {:try_start_cc .. :try_end_cf} :catch_144
    .catchall {:try_start_cc .. :try_end_cf} :catchall_13c

    :cond_cf
    :goto_cf
    :try_start_cf
    throw v15
    :try_end_d0
    .catch Ljava/lang/Throwable; {:try_start_cf .. :try_end_d0} :catch_d0
    .catchall {:try_start_cf .. :try_end_d0} :catchall_13c

    .line 94
    .end local v4    # "cursor":Landroid/database/Cursor;
    :catch_d0
    move-exception v15

    :try_start_d1
    throw v15
    :try_end_d2
    .catchall {:try_start_d1 .. :try_end_d2} :catchall_d2

    .line 124
    :catchall_d2
    move-exception v18

    move-object/from16 v22, v18

    move-object/from16 v18, v15

    move-object/from16 v15, v22

    :goto_d9
    if-eqz v10, :cond_e0

    if-eqz v18, :cond_15c

    :try_start_dd
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_e0
    .catch Ljava/lang/Throwable; {:try_start_dd .. :try_end_e0} :catch_157
    .catch Ljava/lang/Exception; {:try_start_dd .. :try_end_e0} :catch_e1

    :cond_e0
    :goto_e0
    :try_start_e0
    throw v15
    :try_end_e1
    .catch Ljava/lang/Exception; {:try_start_e0 .. :try_end_e1} :catch_e1

    .end local v10    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :catch_e1
    move-exception v6

    .line 125
    .local v6, "e":Ljava/lang/Exception;
    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v18, 0x0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "showTracks():"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v6}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v15, v18

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    goto/16 :goto_1e

    .line 121
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_107
    :try_start_107
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 122
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 123
    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v20, 0x0

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v15, v20

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z
    :try_end_11d
    .catch Ljava/lang/Throwable; {:try_start_107 .. :try_end_11d} :catch_bf
    .catchall {:try_start_107 .. :try_end_11d} :catchall_160

    .line 124
    if-eqz v4, :cond_124

    if-eqz v18, :cond_140

    :try_start_121
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_124
    .catch Ljava/lang/Throwable; {:try_start_121 .. :try_end_124} :catch_135
    .catchall {:try_start_121 .. :try_end_124} :catchall_13c

    :cond_124
    :goto_124
    if-eqz v10, :cond_1e

    if-eqz v19, :cond_152

    :try_start_128
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_12b
    .catch Ljava/lang/Throwable; {:try_start_128 .. :try_end_12b} :catch_12d
    .catch Ljava/lang/Exception; {:try_start_128 .. :try_end_12b} :catch_e1

    goto/16 :goto_1e

    :catch_12d
    move-exception v15

    :try_start_12e
    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_133
    .catch Ljava/lang/Exception; {:try_start_12e .. :try_end_133} :catch_e1

    goto/16 :goto_1e

    :catch_135
    move-exception v15

    :try_start_136
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_124

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :catchall_13c
    move-exception v15

    move-object/from16 v18, v19

    goto :goto_d9

    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_140
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    goto :goto_124

    .end local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :catch_144
    move-exception v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_cf

    :cond_14d
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_150
    .catch Ljava/lang/Throwable; {:try_start_136 .. :try_end_150} :catch_d0
    .catchall {:try_start_136 .. :try_end_150} :catchall_13c

    goto/16 :goto_cf

    .restart local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_152
    :try_start_152
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto/16 :goto_1e

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :catch_157
    move-exception v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_e0

    :cond_15c
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_15f
    .catch Ljava/lang/Exception; {:try_start_152 .. :try_end_15f} :catch_e1

    goto :goto_e0

    .restart local v4    # "cursor":Landroid/database/Cursor;
    :catchall_160
    move-exception v15

    goto/16 :goto_c8
.end method

.method public varargs log([Ljava/lang/String;)Z
    .registers 9
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 280
    invoke-super {p0, p1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->stringArrayToString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 281
    .local v2, "s":Ljava/lang/String;
    :try_start_5
    new-instance v1, Ljava/io/FileWriter;

    iget-object v4, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->logFilePath:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_d} :catch_26

    .local v1, "fileWriter":Ljava/io/FileWriter;
    const/4 v4, 0x0

    .line 282
    :try_start_e
    const-string v5, "mifit"

    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    invoke-virtual {v1, v2}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 284
    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_19} :catch_49
    .catchall {:try_start_e .. :try_end_19} :catchall_60

    .line 285
    if-eqz v1, :cond_20

    if-eqz v4, :cond_45

    :try_start_1d
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_20} :catch_21
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_20} :catch_26

    .line 289
    .end local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_20
    :goto_20
    return v3

    .line 285
    .restart local v1    # "fileWriter":Ljava/io/FileWriter;
    :catch_21
    move-exception v5

    :try_start_22
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_25} :catch_26

    goto :goto_20

    .end local v1    # "fileWriter":Ljava/io/FileWriter;
    :catch_26
    move-exception v0

    .line 286
    .local v0, "e":Ljava/lang/Exception;
    const-string v3, "mifit"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ex while logging:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    const/4 v3, 0x0

    goto :goto_20

    .line 285
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_45
    :try_start_45
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_48} :catch_26

    goto :goto_20

    .line 281
    :catch_49
    move-exception v3

    :try_start_4a
    throw v3
    :try_end_4b
    .catchall {:try_start_4a .. :try_end_4b} :catchall_4b

    .line 285
    :catchall_4b
    move-exception v4

    move-object v6, v4

    move-object v4, v3

    move-object v3, v6

    :goto_4f
    if-eqz v1, :cond_56

    if-eqz v4, :cond_5c

    :try_start_53
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_53 .. :try_end_56} :catch_57
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_56} :catch_26

    :cond_56
    :goto_56
    :try_start_56
    throw v3

    :catch_57
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_56

    :cond_5c
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_5f
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_5f} :catch_26

    goto :goto_56

    :catchall_60
    move-exception v3

    goto :goto_4f
.end method

.method public showToast(Ljava/lang/String;I)V
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 294
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    invoke-static {v0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 295
    return-void
.end method

.method public showTracks()V
    .registers 11

    .prologue
    .line 132
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->loadTrackHeadersFromDb()Ljava/util/Map;

    move-result-object v6

    .line 134
    .local v6, "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v7, "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    new-array v5, v8, [Ljava/lang/String;

    .line 140
    .local v5, "trackDesc":[Ljava/lang/String;
    check-cast v6, Ljava/util/TreeMap;

    .line 141
    .end local v6    # "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    invoke-virtual {v6}, Ljava/util/TreeMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/NavigableMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 142
    .local v1, "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;>;"
    const/4 v3, 0x1

    .line 143
    .local v3, "i":I
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_20
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_42

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 144
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;

    invoke-virtual {v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v3

    .line 146
    add-int/lit8 v3, v3, 0x1

    .line 147
    goto :goto_20

    .line 149
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    :cond_42
    new-instance v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;

    invoke-direct {v4, p0, p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;Ljava/util/ArrayList;)V

    .line 151
    .local v4, "trackChooseListener":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    invoke-direct {v0, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 152
    .local v0, "alert":Landroid/app/AlertDialog$Builder;
    const-string v8, "Choose track to export:"

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 153
    invoke-virtual {v0, v5, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 154
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    .line 155
    return-void
.end method
