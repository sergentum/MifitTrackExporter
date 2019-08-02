.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
.super Ljava/lang/Object;
.source "Starter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "mifit"

.field private static final TMP_DB_QUERY:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS dummy (\"_id\"  INTEGER primary key autoincrement, \n  \"CALENDAR\" INTEGER )"

.field private static final TRACK_DATA_QUERY:Ljava/lang/String; = "SELECT TRACKDATA.TRACKID,TRACKDATA.SIZE,TRACKDATA.BULKLL,TRACKDATA.BULKGAIT,TRACKDATA.BULKAL,TRACKDATA.BULKTIME,TRACKDATA.BULKHR,TRACKDATA.BULKPACE,TRACKDATA.BULKPAUSE,TRACKDATA.BULKSPEED,TRACKDATA.TYPE,TRACKDATA.BULKFLAG,TRACKRECORD.COSTTIME,TRACKRECORD.ENDTIME, TRACKRECORD.DISTANCE FROM TRACKDATA, TRACKRECORD WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID AND TRACKDATA.TRACKID = "

.field private static final TRACK_ID_QUERY:Ljava/lang/String; = "   SELECT TRACKRECORD.TRACKID,       TRACKDATA.TYPE,       TRACKRECORD.DISTANCE,       TRACKRECORD.COSTTIME       FROM TRACKDATA, TRACKRECORD       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;"


# instance fields
.field private activity:Landroid/app/Activity;

.field private dbPath:Ljava/lang/String;

.field private logFilePath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->activity:Landroid/app/Activity;

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->DEVICE_PATH:Ljava/lang/String;

    .line 73
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "language":Ljava/lang/String;
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->checkFilePath()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 76
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->getDbPath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->dbPath:Ljava/lang/String;

    .line 81
    :goto_36
    return-void

    .line 78
    :cond_37
    const-string v1, "can\'t get access to filesystem"

    const/4 v2, 0x0

    invoke-static {p1, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 79
    const-string v1, "mifit"

    const-string v2, "can\'t get access to filesystem"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_36
.end method

.method static synthetic access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;J)V
    .registers 4
    .param p0, "x0"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
    .param p1, "x1"    # J

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->readRawDataWithId(J)V

    return-void
.end method

.method private checkExtDb()Ljava/lang/String;
    .registers 14

    .prologue
    const/4 v12, 0x1

    const/4 v8, 0x0

    .line 218
    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v5

    .line 219
    .local v5, "mifit_dir_path":Ljava/lang/String;
    invoke-direct {p0, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    .line 220
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 221
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

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 222
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_a9

    .line 224
    :try_start_2e
    invoke-virtual {v4}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v3

    .line 225
    .local v3, "list":[Ljava/lang/String;
    array-length v9, v3

    move v7, v8

    :goto_34
    if-ge v7, v9, :cond_a9

    aget-object v2, v3, v7

    .line 226
    .local v2, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
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

    .line 228
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 229
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

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 230
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

    invoke-virtual {p0, v7, v9}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->showToast(Ljava/lang/String;I)V
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_86} :catch_8a

    .line 239
    .end local v0    # "curFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "list":[Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    :goto_86
    return-object v6

    .line 225
    .restart local v0    # "curFile":Ljava/io/File;
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "list":[Ljava/lang/String;
    :cond_87
    add-int/lit8 v7, v7, 0x1

    goto :goto_34

    .line 234
    .end local v0    # "curFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "list":[Ljava/lang/String;
    :catch_8a
    move-exception v1

    .line 235
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

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 238
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_a9
    new-array v7, v12, [Ljava/lang/String;

    const-string v9, "ext db not found"

    aput-object v9, v7, v8

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 239
    const/4 v6, 0x0

    goto :goto_86
.end method

.method private checkFilePath()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 276
    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getDebugPath()Ljava/lang/String;

    move-result-object v0

    .line 277
    .local v0, "filePath":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 278
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "log.txt"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->logFilePath:Ljava/lang/String;

    .line 279
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "."

    aput-object v3, v2, v1

    invoke-virtual {p0, v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    move-result v1

    .line 281
    :cond_2b
    return v1
.end method

.method private checkIfPathExistAndCreate(Ljava/lang/String;)Z
    .registers 9
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 316
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 317
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_26

    .line 318
    const-string v3, "mifit"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "file exists:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    :goto_25
    return v2

    .line 321
    :cond_26
    const-string v4, "mifit"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "file doesn\'t exists:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v4

    if-eqz v4, :cond_5d

    .line 323
    const-string v3, "mifit"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "filepath created:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_25

    .line 326
    :cond_5d
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "filepath can\'t be created:"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 327
    .local v1, "msg":Ljava/lang/String;
    const-string v2, "mifit"

    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    invoke-virtual {p0, v1, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->showToast(Ljava/lang/String;I)V

    move v2, v3

    .line 331
    goto :goto_25
.end method

.method private dbPathFinder()Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 266
    iget-object v3, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->activity:Landroid/app/Activity;

    const-string v4, "tmp.db"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v6, v5}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 267
    .local v0, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "CREATE TABLE IF NOT EXISTS dummy (\"_id\"  INTEGER primary key autoincrement, \n  \"CALENDAR\" INTEGER )"

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 268
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 269
    .local v2, "tmpDbPath":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 270
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 271
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

    invoke-virtual {p0, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 272
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private findOriginDb()Ljava/lang/String;
    .registers 16

    .prologue
    const/4 v14, 0x1

    const/4 v9, 0x0

    .line 243
    const-string v8, "^origin_db_[A-Za-z0-9]*$"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 245
    .local v7, "pattern":Ljava/util/regex/Pattern;
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->dbPathFinder()Ljava/lang/String;

    move-result-object v5

    .line 247
    .local v5, "pathToDb":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 248
    .local v2, "directory":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 250
    .local v4, "list":[Ljava/lang/String;
    array-length v10, v4

    move v8, v9

    :goto_17
    if-ge v8, v10, :cond_70

    aget-object v3, v4, v8

    .line 251
    .local v3, "file":Ljava/lang/String;
    invoke-virtual {v7, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    .line 252
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

    invoke-virtual {p0, v11}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 253
    if-eqz v1, :cond_6d

    .line 254
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 256
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

    invoke-virtual {p0, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 262
    .end local v0    # "dbFile":Ljava/io/File;
    .end local v1    # "dbFound":Z
    .end local v3    # "file":Ljava/lang/String;
    .end local v6    # "pathToOriginDb":Ljava/lang/String;
    :goto_6c
    return-object v6

    .line 250
    .restart local v1    # "dbFound":Z
    .restart local v3    # "file":Ljava/lang/String;
    :cond_6d
    add-int/lit8 v8, v8, 0x1

    goto :goto_17

    .line 261
    .end local v1    # "dbFound":Z
    .end local v3    # "file":Ljava/lang/String;
    :cond_70
    new-array v8, v14, [Ljava/lang/String;

    const-string v10, "origin db not found"

    aput-object v10, v8, v9

    invoke-virtual {p0, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 262
    const/4 v6, 0x0

    goto :goto_6c
.end method

.method private getDbPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 209
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->checkExtDb()Ljava/lang/String;

    move-result-object v0

    .line 210
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 211
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->findOriginDb()Ljava/lang/String;

    move-result-object v0

    .line 213
    :cond_a
    return-object v0
.end method

.method private readRawDataWithId(J)V
    .registers 20
    .param p1, "id"    # J

    .prologue
    .line 158
    :try_start_0
    move-object/from16 v0, p0

    iget-object v11, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->activity:Landroid/app/Activity;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->dbPath:Ljava/lang/String;

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-virtual {v11, v12, v13, v14}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_82

    move-result-object v9

    .local v9, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v13, 0x0

    .line 159
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
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_28} :catch_74
    .catchall {:try_start_f .. :try_end_28} :catchall_165

    move-result-object v4

    .line 158
    .local v4, "cursor":Landroid/database/Cursor;
    const/4 v12, 0x0

    .line 161
    :try_start_2a
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 162
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .local v8, "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v11

    if-nez v11, :cond_140

    .line 164
    new-instance v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;

    invoke-direct {v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;-><init>()V

    .line 165
    .local v7, "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3e
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnCount()I

    move-result v11

    if-ge v6, v11, :cond_13d

    .line 166
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 167
    .local v3, "columnValue":Ljava/lang/String;
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    .line 168
    .local v2, "columnName":Ljava/lang/String;
    if-eqz v3, :cond_58

    .line 169
    const-string v11, "TRACKID"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_5b

    .line 170
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->startTime:Ljava/lang/String;

    .line 165
    :cond_58
    :goto_58
    add-int/lit8 v6, v6, 0x1

    goto :goto_3e

    .line 171
    :cond_5b
    const-string v11, "ENDTIME"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_b2

    .line 172
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->endTime:Ljava/lang/String;
    :try_end_65
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_65} :catch_66
    .catchall {:try_start_2a .. :try_end_65} :catchall_bd

    goto :goto_58

    .line 158
    .end local v2    # "columnName":Ljava/lang/String;
    .end local v3    # "columnValue":Ljava/lang/String;
    .end local v6    # "i":I
    .end local v7    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    :catch_66
    move-exception v11

    :try_start_67
    throw v11
    :try_end_68
    .catchall {:try_start_67 .. :try_end_68} :catchall_68

    .line 203
    :catchall_68
    move-exception v12

    move-object v15, v12

    move-object v12, v11

    move-object v11, v15

    :goto_6c
    if-eqz v4, :cond_73

    if-eqz v12, :cond_173

    :try_start_70
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_73
    .catch Ljava/lang/Throwable; {:try_start_70 .. :try_end_73} :catch_16d
    .catchall {:try_start_70 .. :try_end_73} :catchall_165

    :cond_73
    :goto_73
    :try_start_73
    throw v11
    :try_end_74
    .catch Ljava/lang/Throwable; {:try_start_73 .. :try_end_74} :catch_74
    .catchall {:try_start_73 .. :try_end_74} :catchall_165

    .line 158
    .end local v4    # "cursor":Landroid/database/Cursor;
    :catch_74
    move-exception v11

    :try_start_75
    throw v11
    :try_end_76
    .catchall {:try_start_75 .. :try_end_76} :catchall_76

    .line 203
    :catchall_76
    move-exception v12

    move-object v15, v12

    move-object v12, v11

    move-object v11, v15

    :goto_7a
    if-eqz v9, :cond_81

    if-eqz v12, :cond_183

    :try_start_7e
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_81
    .catch Ljava/lang/Throwable; {:try_start_7e .. :try_end_81} :catch_17d
    .catch Ljava/lang/Exception; {:try_start_7e .. :try_end_81} :catch_82

    :cond_81
    :goto_81
    :try_start_81
    throw v11
    :try_end_82
    .catch Ljava/lang/Exception; {:try_start_81 .. :try_end_82} :catch_82

    .end local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :catch_82
    move-exception v5

    .line 204
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

    invoke-virtual {v0, v11}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 206
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_b1
    :goto_b1
    return-void

    .line 173
    .restart local v2    # "columnName":Ljava/lang/String;
    .restart local v3    # "columnValue":Ljava/lang/String;
    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v6    # "i":I
    .restart local v7    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    .restart local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .restart local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :cond_b2
    :try_start_b2
    const-string v11, "COSTTIME"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_bf

    .line 174
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->costTime:Ljava/lang/String;

    goto :goto_58

    .line 203
    .end local v2    # "columnName":Ljava/lang/String;
    .end local v3    # "columnValue":Ljava/lang/String;
    .end local v6    # "i":I
    .end local v7    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    :catchall_bd
    move-exception v11

    goto :goto_6c

    .line 175
    .restart local v2    # "columnName":Ljava/lang/String;
    .restart local v3    # "columnValue":Ljava/lang/String;
    .restart local v6    # "i":I
    .restart local v7    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    .restart local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    :cond_bf
    const-string v11, "SIZE"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_ca

    .line 176
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->size:Ljava/lang/String;

    goto :goto_58

    .line 177
    :cond_ca
    const-string v11, "TYPE"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_d5

    .line 178
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->activityType:Ljava/lang/String;

    goto :goto_58

    .line 179
    :cond_d5
    const-string v11, "DISTANCE"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_e1

    .line 180
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->distance:Ljava/lang/String;

    goto/16 :goto_58

    .line 181
    :cond_e1
    const-string v11, "BULKLL"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_ed

    .line 182
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKLL:Ljava/lang/String;

    goto/16 :goto_58

    .line 183
    :cond_ed
    const-string v11, "BULKGAIT"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_f9

    .line 184
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKGAIT:Ljava/lang/String;

    goto/16 :goto_58

    .line 185
    :cond_f9
    const-string v11, "BULKAL"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_105

    .line 186
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKAL:Ljava/lang/String;

    goto/16 :goto_58

    .line 187
    :cond_105
    const-string v11, "BULKTIME"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_111

    .line 188
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKTIME:Ljava/lang/String;

    goto/16 :goto_58

    .line 189
    :cond_111
    const-string v11, "BULKHR"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_125

    .line 190
    const-string v11, ";,"

    const-string v14, ";1,"

    invoke-virtual {v3, v11, v14}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v11

    iput-object v11, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKHR:Ljava/lang/String;

    goto/16 :goto_58

    .line 191
    :cond_125
    const-string v11, "BULKPACE"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_131

    .line 192
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKPACE:Ljava/lang/String;

    goto/16 :goto_58

    .line 193
    :cond_131
    const-string v11, "BULKFLAG"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_58

    .line 194
    iput-object v3, v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;->BULKFLAG:Ljava/lang/String;

    goto/16 :goto_58

    .line 198
    .end local v2    # "columnName":Ljava/lang/String;
    .end local v3    # "columnValue":Ljava/lang/String;
    :cond_13d
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    .end local v6    # "i":I
    .end local v7    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    :cond_140
    new-instance v10, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;)V

    .line 201
    .local v10, "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    invoke-virtual {v10, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->launchExport(Ljava/util/ArrayList;)V
    :try_end_14a
    .catch Ljava/lang/Throwable; {:try_start_b2 .. :try_end_14a} :catch_66
    .catchall {:try_start_b2 .. :try_end_14a} :catchall_bd

    .line 203
    if-eqz v4, :cond_151

    if-eqz v12, :cond_169

    :try_start_14e
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_151
    .catch Ljava/lang/Throwable; {:try_start_14e .. :try_end_151} :catch_160
    .catchall {:try_start_14e .. :try_end_151} :catchall_165

    :cond_151
    :goto_151
    if-eqz v9, :cond_b1

    if-eqz v13, :cond_178

    :try_start_155
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_158
    .catch Ljava/lang/Throwable; {:try_start_155 .. :try_end_158} :catch_15a
    .catch Ljava/lang/Exception; {:try_start_155 .. :try_end_158} :catch_82

    goto/16 :goto_b1

    :catch_15a
    move-exception v11

    :try_start_15b
    invoke-virtual {v13, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_15e
    .catch Ljava/lang/Exception; {:try_start_15b .. :try_end_15e} :catch_82

    goto/16 :goto_b1

    :catch_160
    move-exception v11

    :try_start_161
    invoke-virtual {v12, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_151

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catchall_165
    move-exception v11

    move-object v12, v13

    goto/16 :goto_7a

    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .restart local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :cond_169
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    goto :goto_151

    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catch_16d
    move-exception v14

    invoke-virtual {v12, v14}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_73

    :cond_173
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_176
    .catch Ljava/lang/Throwable; {:try_start_161 .. :try_end_176} :catch_74
    .catchall {:try_start_161 .. :try_end_176} :catchall_165

    goto/16 :goto_73

    .restart local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .restart local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :cond_178
    :try_start_178
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto/16 :goto_b1

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catch_17d
    move-exception v13

    invoke-virtual {v12, v13}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_81

    :cond_183
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_186
    .catch Ljava/lang/Exception; {:try_start_178 .. :try_end_186} :catch_82

    goto/16 :goto_81
.end method

.method public static writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .param p0, "output"    # Ljava/lang/String;
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 304
    :try_start_0
    new-instance v1, Ljava/io/FileWriter;

    invoke-direct {v1, p1}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_17

    .local v1, "fileWriter":Ljava/io/FileWriter;
    const/4 v4, 0x0

    .line 305
    :try_start_6
    invoke-virtual {v1, p0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_9} :catch_4b
    .catchall {:try_start_6 .. :try_end_9} :catchall_4d

    .line 306
    const/4 v2, 0x1

    .line 307
    .local v2, "result":Z
    if-eqz v1, :cond_11

    if-eqz v4, :cond_47

    :try_start_e
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_11} :catch_12
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_11} :catch_17

    .line 312
    .end local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_11
    :goto_11
    return v2

    .line 307
    .restart local v1    # "fileWriter":Ljava/io/FileWriter;
    :catch_12
    move-exception v3

    :try_start_13
    invoke-virtual {v4, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_16} :catch_17

    goto :goto_11

    .end local v1    # "fileWriter":Ljava/io/FileWriter;
    .end local v2    # "result":Z
    :catch_17
    move-exception v0

    .line 308
    .local v0, "ex":Ljava/io/IOException;
    const-string v3, "mifit"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception message: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", cause: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 309
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 310
    const/4 v2, 0x0

    .restart local v2    # "result":Z
    goto :goto_11

    .line 307
    .end local v0    # "ex":Ljava/io/IOException;
    .restart local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_47
    :try_start_47
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_4a
    .catch Ljava/io/IOException; {:try_start_47 .. :try_end_4a} :catch_17

    goto :goto_11

    .line 304
    .end local v2    # "result":Z
    :catch_4b
    move-exception v4

    :try_start_4c
    throw v4
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_4d

    .line 307
    :catchall_4d
    move-exception v3

    if-eqz v1, :cond_55

    if-eqz v4, :cond_5b

    :try_start_52
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_52 .. :try_end_55} :catch_56
    .catch Ljava/io/IOException; {:try_start_52 .. :try_end_55} :catch_17

    :cond_55
    :goto_55
    :try_start_55
    throw v3

    :catch_56
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_55

    :cond_5b
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_5e
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_5e} :catch_17

    goto :goto_55
.end method


# virtual methods
.method public varargs log([Ljava/lang/String;)Z
    .registers 13
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 286
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 287
    .local v3, "stringBuilder":Ljava/lang/StringBuilder;
    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\r\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    array-length v7, p1

    move v6, v5

    :goto_17
    if-ge v6, v7, :cond_27

    aget-object v0, p1, v6

    .line 289
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\r\n"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    add-int/lit8 v6, v6, 0x1

    goto :goto_17

    .line 291
    .end local v0    # "arg":Ljava/lang/String;
    :cond_27
    :try_start_27
    new-instance v2, Ljava/io/FileWriter;

    iget-object v6, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->logFilePath:Ljava/lang/String;

    const/4 v7, 0x1

    invoke-direct {v2, v6, v7}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2f} :catch_50

    .local v2, "fileWriter":Ljava/io/FileWriter;
    const/4 v6, 0x0

    .line 292
    :try_start_30
    const-string v7, "mifit"

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 294
    invoke-virtual {v2}, Ljava/io/FileWriter;->flush()V
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_43} :catch_73
    .catchall {:try_start_30 .. :try_end_43} :catchall_8a

    .line 295
    if-eqz v2, :cond_4a

    if-eqz v6, :cond_6f

    :try_start_47
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_47 .. :try_end_4a} :catch_4b
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_4a} :catch_50

    .line 299
    .end local v2    # "fileWriter":Ljava/io/FileWriter;
    :cond_4a
    :goto_4a
    return v4

    .line 295
    .restart local v2    # "fileWriter":Ljava/io/FileWriter;
    :catch_4b
    move-exception v7

    :try_start_4c
    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_4f
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4f} :catch_50

    goto :goto_4a

    .end local v2    # "fileWriter":Ljava/io/FileWriter;
    :catch_50
    move-exception v1

    .line 296
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "mifit"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ex while logging:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v4, v5

    .line 297
    goto :goto_4a

    .line 295
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "fileWriter":Ljava/io/FileWriter;
    :cond_6f
    :try_start_6f
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_6f .. :try_end_72} :catch_50

    goto :goto_4a

    .line 291
    :catch_73
    move-exception v4

    :try_start_74
    throw v4
    :try_end_75
    .catchall {:try_start_74 .. :try_end_75} :catchall_75

    .line 295
    :catchall_75
    move-exception v6

    move-object v10, v6

    move-object v6, v4

    move-object v4, v10

    :goto_79
    if-eqz v2, :cond_80

    if-eqz v6, :cond_86

    :try_start_7d
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_80
    .catch Ljava/lang/Throwable; {:try_start_7d .. :try_end_80} :catch_81
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_80} :catch_50

    :cond_80
    :goto_80
    :try_start_80
    throw v4

    :catch_81
    move-exception v7

    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_80

    :cond_86
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_80 .. :try_end_89} :catch_50

    goto :goto_80

    :catchall_8a
    move-exception v4

    goto :goto_79
.end method

.method public showToast(Ljava/lang/String;I)V
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 335
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->activity:Landroid/app/Activity;

    invoke-static {v0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 336
    return-void
.end method

.method public showTracks()V
    .registers 30

    .prologue
    .line 84
    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->dbPath:Ljava/lang/String;

    move-object/from16 v23, v0

    if-nez v23, :cond_1a

    .line 85
    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->activity:Landroid/app/Activity;

    move-object/from16 v23, v0

    const-string v24, "database not found"

    const/16 v25, 0x0

    invoke-static/range {v23 .. v25}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Landroid/widget/Toast;->show()V

    .line 141
    :cond_19
    :goto_19
    return-void

    .line 88
    :cond_1a
    :try_start_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->activity:Landroid/app/Activity;

    move-object/from16 v23, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->dbPath:Ljava/lang/String;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const/16 v26, 0x0

    invoke-virtual/range {v23 .. v26}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_2d} :catch_10a

    move-result-object v11

    .line 87
    .local v11, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const/16 v25, 0x0

    .line 89
    :try_start_30
    const-string v23, "   SELECT TRACKRECORD.TRACKID,       TRACKDATA.TYPE,       TRACKRECORD.DISTANCE,       TRACKRECORD.COSTTIME       FROM TRACKDATA, TRACKRECORD       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;"

    const/16 v24, 0x0

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    invoke-virtual {v11, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_3b} :catch_f9
    .catchall {:try_start_30 .. :try_end_3b} :catchall_1e6

    move-result-object v5

    .line 87
    .local v5, "cursor":Landroid/database/Cursor;
    const/16 v24, 0x0

    .line 91
    :try_start_3e
    invoke-interface {v5}, Landroid/database/Cursor;->moveToFirst()Z

    .line 92
    new-instance v19, Ljava/util/TreeMap;

    invoke-direct/range {v19 .. v19}, Ljava/util/TreeMap;-><init>()V

    .line 93
    .local v19, "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .local v15, "stringBuilder":Ljava/lang/StringBuilder;
    :goto_4b
    invoke-interface {v5}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v23

    if-nez v23, :cond_137

    .line 95
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_52
    invoke-interface {v5}, Landroid/database/Cursor;->getColumnCount()I

    move-result v23

    move/from16 v0, v23

    if-ge v10, v0, :cond_92

    .line 96
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v26, " "

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    if-nez v10, :cond_8f

    .line 98
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 99
    .local v14, "string":Ljava/lang/String;
    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    .line 100
    .local v12, "l":J
    new-instance v6, Ljava/util/Date;

    const-wide/16 v26, 0x3e8

    mul-long v26, v26, v12

    move-wide/from16 v0, v26

    invoke-direct {v6, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 101
    .local v6, "date":Ljava/util/Date;
    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v23

    const-string v26, " "

    move-object/from16 v0, v23

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .end local v6    # "date":Ljava/util/Date;
    .end local v12    # "l":J
    .end local v14    # "string":Ljava/lang/String;
    :cond_8f
    add-int/lit8 v10, v10, 0x1

    goto :goto_52

    .line 104
    :cond_92
    const-string v23, "\n"

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    new-instance v18, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;

    invoke-direct/range {v18 .. v18}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;-><init>()V

    .line 107
    .local v18, "trackHeader":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;
    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    .line 108
    .local v20, "trackId":J
    move-wide/from16 v0, v20

    move-object/from16 v2, v18

    iput-wide v0, v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->id:J

    .line 109
    const/16 v23, 0x1

    move/from16 v0, v23

    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    move/from16 v0, v23

    move-object/from16 v1, v18

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->type:I

    .line 110
    const/16 v23, 0x2

    move/from16 v0, v23

    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    move/from16 v0, v23

    move-object/from16 v1, v18

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->distance:I

    .line 111
    const/16 v23, 0x3

    move/from16 v0, v23

    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    move/from16 v0, v23

    move-object/from16 v1, v18

    iput v0, v1, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->duration:I

    .line 112
    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v23

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_e6
    .catch Ljava/lang/Throwable; {:try_start_3e .. :try_end_e6} :catch_e8
    .catchall {:try_start_3e .. :try_end_e6} :catchall_20e

    goto/16 :goto_4b

    .line 87
    .end local v10    # "i":I
    .end local v15    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v18    # "trackHeader":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;
    .end local v19    # "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    .end local v20    # "trackId":J
    :catch_e8
    move-exception v23

    :try_start_e9
    throw v23
    :try_end_ea
    .catchall {:try_start_e9 .. :try_end_ea} :catchall_ea

    .line 137
    :catchall_ea
    move-exception v24

    move-object/from16 v28, v24

    move-object/from16 v24, v23

    move-object/from16 v23, v28

    :goto_f1
    if-eqz v5, :cond_f8

    if-eqz v24, :cond_1f9

    :try_start_f5
    invoke-interface {v5}, Landroid/database/Cursor;->close()V
    :try_end_f8
    .catch Ljava/lang/Throwable; {:try_start_f5 .. :try_end_f8} :catch_1ef
    .catchall {:try_start_f5 .. :try_end_f8} :catchall_1e6

    :cond_f8
    :goto_f8
    :try_start_f8
    throw v23
    :try_end_f9
    .catch Ljava/lang/Throwable; {:try_start_f8 .. :try_end_f9} :catch_f9
    .catchall {:try_start_f8 .. :try_end_f9} :catchall_1e6

    .line 87
    .end local v5    # "cursor":Landroid/database/Cursor;
    :catch_f9
    move-exception v23

    :try_start_fa
    throw v23
    :try_end_fb
    .catchall {:try_start_fa .. :try_end_fb} :catchall_fb

    .line 137
    :catchall_fb
    move-exception v24

    move-object/from16 v28, v24

    move-object/from16 v24, v23

    move-object/from16 v23, v28

    :goto_102
    if-eqz v11, :cond_109

    if-eqz v24, :cond_209

    :try_start_106
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_109
    .catch Ljava/lang/Throwable; {:try_start_106 .. :try_end_109} :catch_203
    .catch Ljava/lang/Exception; {:try_start_106 .. :try_end_109} :catch_10a

    :cond_109
    :goto_109
    :try_start_109
    throw v23
    :try_end_10a
    .catch Ljava/lang/Exception; {:try_start_109 .. :try_end_10a} :catch_10a

    .end local v11    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :catch_10a
    move-exception v7

    .line 138
    .local v7, "e":Ljava/lang/Exception;
    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "showTracks():"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v7}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    aput-object v25, v23, v24

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    goto/16 :goto_19

    .line 115
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v5    # "cursor":Landroid/database/Cursor;
    .restart local v11    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v15    # "stringBuilder":Ljava/lang/StringBuilder;
    .restart local v19    # "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    :cond_137
    :try_start_137
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 116
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 118
    const/16 v23, 0x1

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v23, v0

    const/16 v26, 0x0

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    aput-object v27, v23, v26

    move-object/from16 v0, p0

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->log([Ljava/lang/String;)Z

    .line 120
    new-instance v22, Ljava/util/ArrayList;

    invoke-direct/range {v22 .. v22}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v22, "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-interface/range {v19 .. v19}, Ljava/util/Map;->size()I

    move-result v23

    move/from16 v0, v23

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    .line 122
    .local v17, "trackDesc":[Ljava/lang/String;
    check-cast v19, Ljava/util/TreeMap;

    .line 123
    .end local v19    # "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    invoke-virtual/range {v19 .. v19}, Ljava/util/TreeMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Ljava/util/NavigableMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    .line 124
    .local v8, "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;>;"
    const/4 v10, 0x0

    .line 125
    .restart local v10    # "i":I
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v26

    :goto_172
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v23

    if-eqz v23, :cond_194

    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    .line 126
    .local v9, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;

    invoke-virtual/range {v23 .. v23}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->toString()Ljava/lang/String;

    move-result-object v23

    aput-object v23, v17, v10

    .line 128
    add-int/lit8 v10, v10, 0x1

    .line 129
    goto :goto_172

    .line 131
    .end local v9    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    :cond_194
    new-instance v16, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    move-object/from16 v2, p0

    move-object/from16 v3, v22

    invoke-direct {v0, v1, v2, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;Ljava/util/ArrayList;)V

    .line 133
    .local v16, "trackChooseListener":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;
    new-instance v4, Landroid/app/AlertDialog$Builder;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->activity:Landroid/app/Activity;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-direct {v4, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 134
    .local v4, "alert":Landroid/app/AlertDialog$Builder;
    const-string v23, "Choose track to export:"

    move-object/from16 v0, v23

    invoke-virtual {v4, v0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 135
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v4, v0, v1}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 136
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Landroid/app/AlertDialog;->show()V
    :try_end_1c3
    .catch Ljava/lang/Throwable; {:try_start_137 .. :try_end_1c3} :catch_e8
    .catchall {:try_start_137 .. :try_end_1c3} :catchall_20e

    .line 137
    if-eqz v5, :cond_1ca

    if-eqz v24, :cond_1eb

    :try_start_1c7
    invoke-interface {v5}, Landroid/database/Cursor;->close()V
    :try_end_1ca
    .catch Ljava/lang/Throwable; {:try_start_1c7 .. :try_end_1ca} :catch_1dd
    .catchall {:try_start_1c7 .. :try_end_1ca} :catchall_1e6

    :cond_1ca
    :goto_1ca
    if-eqz v11, :cond_19

    if-eqz v25, :cond_1fe

    :try_start_1ce
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1d1
    .catch Ljava/lang/Throwable; {:try_start_1ce .. :try_end_1d1} :catch_1d3
    .catch Ljava/lang/Exception; {:try_start_1ce .. :try_end_1d1} :catch_10a

    goto/16 :goto_19

    :catch_1d3
    move-exception v23

    :try_start_1d4
    move-object/from16 v0, v25

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_1db
    .catch Ljava/lang/Exception; {:try_start_1d4 .. :try_end_1db} :catch_10a

    goto/16 :goto_19

    :catch_1dd
    move-exception v23

    :try_start_1de
    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1ca

    .end local v4    # "alert":Landroid/app/AlertDialog$Builder;
    .end local v5    # "cursor":Landroid/database/Cursor;
    .end local v8    # "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;>;"
    .end local v10    # "i":I
    .end local v15    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v16    # "trackChooseListener":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;
    .end local v17    # "trackDesc":[Ljava/lang/String;
    .end local v22    # "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    :catchall_1e6
    move-exception v23

    move-object/from16 v24, v25

    goto/16 :goto_102

    .restart local v4    # "alert":Landroid/app/AlertDialog$Builder;
    .restart local v5    # "cursor":Landroid/database/Cursor;
    .restart local v8    # "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;>;"
    .restart local v10    # "i":I
    .restart local v15    # "stringBuilder":Ljava/lang/StringBuilder;
    .restart local v16    # "trackChooseListener":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;
    .restart local v17    # "trackDesc":[Ljava/lang/String;
    .restart local v22    # "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    :cond_1eb
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    goto :goto_1ca

    .end local v4    # "alert":Landroid/app/AlertDialog$Builder;
    .end local v8    # "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;>;"
    .end local v10    # "i":I
    .end local v15    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v16    # "trackChooseListener":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;
    .end local v17    # "trackDesc":[Ljava/lang/String;
    .end local v22    # "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    :catch_1ef
    move-exception v26

    move-object/from16 v0, v24

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_f8

    :cond_1f9
    invoke-interface {v5}, Landroid/database/Cursor;->close()V
    :try_end_1fc
    .catch Ljava/lang/Throwable; {:try_start_1de .. :try_end_1fc} :catch_f9
    .catchall {:try_start_1de .. :try_end_1fc} :catchall_1e6

    goto/16 :goto_f8

    .restart local v4    # "alert":Landroid/app/AlertDialog$Builder;
    .restart local v8    # "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;>;"
    .restart local v10    # "i":I
    .restart local v15    # "stringBuilder":Ljava/lang/StringBuilder;
    .restart local v16    # "trackChooseListener":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;
    .restart local v17    # "trackDesc":[Ljava/lang/String;
    .restart local v22    # "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    :cond_1fe
    :try_start_1fe
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto/16 :goto_19

    .end local v4    # "alert":Landroid/app/AlertDialog$Builder;
    .end local v5    # "cursor":Landroid/database/Cursor;
    .end local v8    # "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;>;"
    .end local v10    # "i":I
    .end local v15    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v16    # "trackChooseListener":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;
    .end local v17    # "trackDesc":[Ljava/lang/String;
    .end local v22    # "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    :catch_203
    move-exception v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_109

    :cond_209
    invoke-virtual {v11}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_20c
    .catch Ljava/lang/Exception; {:try_start_1fe .. :try_end_20c} :catch_10a

    goto/16 :goto_109

    .restart local v5    # "cursor":Landroid/database/Cursor;
    :catchall_20e
    move-exception v23

    goto/16 :goto_f1
.end method
