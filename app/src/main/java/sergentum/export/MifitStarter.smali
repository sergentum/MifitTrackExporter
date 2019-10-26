.class public Lsergentum/export/MifitStarter;
.super Lsergentum/export/Starter;
.source "MifitStarter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lsergentum/export/MifitStarter$ChooseTrackClickListener;
    }
.end annotation


# static fields
.field private static final TMP_DB_QUERY:Ljava/lang/String; = "CREATE TABLE IF NOT EXISTS dummy (\"_id\"  INTEGER primary key autoincrement, \n  \"CALENDAR\" INTEGER )"


# instance fields
.field private activity:Landroid/app/Activity;

.field private dbPath:Ljava/lang/String;

.field private logFilePath:Ljava/lang/String;

.field private sp:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x0

    .line 47
    invoke-direct {p0}, Lsergentum/export/Starter;-><init>()V

    .line 48
    iput-object p1, p0, Lsergentum/export/MifitStarter;->activity:Landroid/app/Activity;

    .line 49
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

    sput-object v1, Lsergentum/export/MifitStarter;->DEVICE_PATH:Ljava/lang/String;

    .line 50
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lsergentum/export/MifitStarter;->sp:Landroid/content/SharedPreferences;

    .line 51
    iget-object v1, p0, Lsergentum/export/MifitStarter;->sp:Landroid/content/SharedPreferences;

    const-string v2, "export_format"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lsergentum/export/MifitStarter;->FILE_FORMAT:Ljava/lang/String;

    .line 52
    iget-object v1, p0, Lsergentum/export/MifitStarter;->sp:Landroid/content/SharedPreferences;

    const-string v2, "debug"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    sput-object v1, Lsergentum/export/MifitStarter;->debug:Ljava/lang/Boolean;

    .line 53
    const-string v1, "mifit"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TrackExporter.debug: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lsergentum/export/MifitStarter;->debug:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "language":Ljava/lang/String;
    const-string v1, "mifit"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Locale.getDefault().getLanguage(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    invoke-direct {p0}, Lsergentum/export/MifitStarter;->checkFilePath()Z

    move-result v1

    if-eqz v1, :cond_8a

    .line 59
    invoke-direct {p0}, Lsergentum/export/MifitStarter;->getDbPath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lsergentum/export/MifitStarter;->dbPath:Ljava/lang/String;

    .line 64
    :goto_89
    return-void

    .line 61
    :cond_8a
    const-string v1, "can\'t get access to filesystem"

    invoke-static {p1, v1, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 62
    const-string v1, "mifit"

    const-string v2, "can\'t get access to filesystem"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_89
.end method

.method static synthetic access$000(Lsergentum/export/MifitStarter;)Landroid/app/Activity;
    .registers 2
    .param p0, "x0"    # Lsergentum/export/MifitStarter;

    .prologue
    .line 36
    iget-object v0, p0, Lsergentum/export/MifitStarter;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method private checkExtDb()Ljava/lang/String;
    .registers 14

    .prologue
    const/4 v12, 0x1

    const/4 v8, 0x0

    .line 238
    invoke-static {}, Lsergentum/export/MifitStarter;->getFullPath()Ljava/lang/String;

    move-result-object v5

    .line 239
    .local v5, "mifit_dir_path":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lsergentum/export/MifitStarter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    .line 240
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 241
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

    invoke-virtual {p0, v7}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 242
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_a9

    .line 244
    :try_start_2e
    invoke-virtual {v4}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v3

    .line 245
    .local v3, "list":[Ljava/lang/String;
    array-length v9, v3

    move v7, v8

    :goto_34
    if-ge v7, v9, :cond_a9

    aget-object v2, v3, v7

    .line 246
    .local v2, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
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

    .line 248
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 249
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

    invoke-virtual {p0, v7}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 250
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

    invoke-virtual {p0, v7, v9}, Lsergentum/export/MifitStarter;->showToast(Ljava/lang/String;I)V
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_86} :catch_8a

    .line 259
    .end local v0    # "curFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "list":[Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    :goto_86
    return-object v6

    .line 245
    .restart local v0    # "curFile":Ljava/io/File;
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "list":[Ljava/lang/String;
    :cond_87
    add-int/lit8 v7, v7, 0x1

    goto :goto_34

    .line 254
    .end local v0    # "curFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "list":[Ljava/lang/String;
    :catch_8a
    move-exception v1

    .line 255
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

    invoke-virtual {p0, v7}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 258
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_a9
    new-array v7, v12, [Ljava/lang/String;

    const-string v9, "ext db not found"

    aput-object v9, v7, v8

    invoke-virtual {p0, v7}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 259
    const/4 v6, 0x0

    goto :goto_86
.end method

.method private checkFilePath()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 296
    invoke-static {}, Lsergentum/export/MifitStarter;->getDebugPath()Ljava/lang/String;

    move-result-object v0

    .line 297
    .local v0, "filePath":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lsergentum/export/MifitStarter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 298
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "log.txt"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lsergentum/export/MifitStarter;->logFilePath:Ljava/lang/String;

    .line 299
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "."

    aput-object v3, v2, v1

    invoke-virtual {p0, v2}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    move-result v1

    .line 301
    :cond_2b
    return v1
.end method

.method private dbPathFinder()Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 286
    iget-object v3, p0, Lsergentum/export/MifitStarter;->activity:Landroid/app/Activity;

    const-string v4, "tmp.db"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v6, v5}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 287
    .local v0, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "CREATE TABLE IF NOT EXISTS dummy (\"_id\"  INTEGER primary key autoincrement, \n  \"CALENDAR\" INTEGER )"

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 288
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 289
    .local v2, "tmpDbPath":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 290
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 291
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

    invoke-virtual {p0, v3}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 292
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private findOriginDb()Ljava/lang/String;
    .registers 16

    .prologue
    const/4 v14, 0x1

    const/4 v9, 0x0

    .line 263
    const-string v8, "^origin_db_[A-Za-z0-9]*$"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 265
    .local v7, "pattern":Ljava/util/regex/Pattern;
    invoke-direct {p0}, Lsergentum/export/MifitStarter;->dbPathFinder()Ljava/lang/String;

    move-result-object v5

    .line 267
    .local v5, "pathToDb":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 268
    .local v2, "directory":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 270
    .local v4, "list":[Ljava/lang/String;
    array-length v10, v4

    move v8, v9

    :goto_17
    if-ge v8, v10, :cond_70

    aget-object v3, v4, v8

    .line 271
    .local v3, "file":Ljava/lang/String;
    invoke-virtual {v7, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    .line 272
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

    invoke-virtual {p0, v11}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 273
    if-eqz v1, :cond_6d

    .line 274
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 276
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

    invoke-virtual {p0, v8}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 282
    .end local v0    # "dbFile":Ljava/io/File;
    .end local v1    # "dbFound":Z
    .end local v3    # "file":Ljava/lang/String;
    .end local v6    # "pathToOriginDb":Ljava/lang/String;
    :goto_6c
    return-object v6

    .line 270
    .restart local v1    # "dbFound":Z
    .restart local v3    # "file":Ljava/lang/String;
    :cond_6d
    add-int/lit8 v8, v8, 0x1

    goto :goto_17

    .line 281
    .end local v1    # "dbFound":Z
    .end local v3    # "file":Ljava/lang/String;
    :cond_70
    new-array v8, v14, [Ljava/lang/String;

    const-string v10, "origin db not found"

    aput-object v10, v8, v9

    invoke-virtual {p0, v8}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 282
    const/4 v6, 0x0

    goto :goto_6c
.end method

.method private getDbPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 229
    invoke-direct {p0}, Lsergentum/export/MifitStarter;->checkExtDb()Ljava/lang/String;

    move-result-object v0

    .line 230
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 231
    invoke-direct {p0}, Lsergentum/export/MifitStarter;->findOriginDb()Ljava/lang/String;

    move-result-object v0

    .line 233
    :cond_a
    return-object v0
.end method


# virtual methods
.method public exportTrack(Ljava/lang/Long;)V
    .registers 16
    .param p1, "trackId"    # Ljava/lang/Long;

    .prologue
    .line 172
    invoke-virtual {p0, p1}, Lsergentum/export/MifitStarter;->fetchTrackById(Ljava/lang/Long;)Lsergentum/export/core/Model$Track;

    move-result-object v8

    .line 173
    .local v8, "track":Lsergentum/export/core/Model$Track;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 174
    .local v4, "start":J
    const-string v2, ""

    .line 175
    .local v2, "message":Ljava/lang/String;
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Format selected: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    sget-object v13, Lsergentum/export/MifitStarter;->FILE_FORMAT:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-virtual {p0, v10}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 176
    sget-object v11, Lsergentum/export/MifitStarter;->FILE_FORMAT:Ljava/lang/String;

    const/4 v10, -0x1

    invoke-virtual {v11}, Ljava/lang/String;->hashCode()I

    move-result v12

    sparse-switch v12, :sswitch_data_13c

    :cond_32
    :goto_32
    packed-switch v10, :pswitch_data_14a

    .line 195
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0, v8}, Lsergentum/export/MifitStarter;->exportTCX(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 196
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0, v8}, Lsergentum/export/MifitStarter;->exportGPX(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 200
    :goto_65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 201
    .local v6, "stop":J
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\n Spent "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sub-long v12, v6, v4

    invoke-virtual {v10, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " ms "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 202
    .local v3, "successMessage":Ljava/lang/String;
    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v3, v10, v11

    invoke-virtual {p0, v10}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 203
    const/4 v10, 0x1

    invoke-virtual {p0, v3, v10}, Lsergentum/export/MifitStarter;->showToast(Ljava/lang/String;I)V

    .line 204
    return-void

    .line 176
    .end local v3    # "successMessage":Ljava/lang/String;
    .end local v6    # "stop":J
    :sswitch_96
    const-string v12, ".tcx"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_32

    const/4 v10, 0x0

    goto :goto_32

    :sswitch_a0
    const-string v12, ".gpx"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_32

    const/4 v10, 0x1

    goto :goto_32

    :sswitch_aa
    const-string v12, "endomondo"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_32

    const/4 v10, 0x2

    goto/16 :goto_32

    .line 178
    :pswitch_b5
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0, v8}, Lsergentum/export/MifitStarter;->exportTCX(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 179
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\nsaved to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lsergentum/export/MifitStarter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 180
    goto :goto_65

    .line 183
    :pswitch_e4
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0, v8}, Lsergentum/export/MifitStarter;->exportGPX(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 184
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\nsaved to "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lsergentum/export/MifitStarter;->EXPORT_PATH:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 185
    goto/16 :goto_65

    .line 188
    :pswitch_114
    iget-object v10, p0, Lsergentum/export/MifitStarter;->sp:Landroid/content/SharedPreferences;

    sget-object v11, Lsergentum/export/SettingsActivity;->ENDOMONDO_APIKEY:Ljava/lang/String;

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 189
    .local v0, "endoApiKey":Ljava/lang/String;
    new-instance v1, Lsergentum/sync/EndomondoSyncronizer;

    invoke-direct {v1, v0, p0}, Lsergentum/sync/EndomondoSyncronizer;-><init>(Ljava/lang/String;Lsergentum/export/Starter;)V

    .line 190
    .local v1, "endomondoSyncronizer":Lsergentum/sync/EndomondoSyncronizer;
    invoke-virtual {v1, v8}, Lsergentum/sync/EndomondoSyncronizer;->upload(Lsergentum/export/core/Model$Track;)Lsergentum/sync/Synchronizer$Status;

    move-result-object v9

    .line 191
    .local v9, "upload":Lsergentum/sync/Synchronizer$Status;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v9, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 192
    goto/16 :goto_65

    .line 176
    nop

    :sswitch_data_13c
    .sparse-switch
        -0x70b1b9dd -> :sswitch_aa
        0x1679c1 -> :sswitch_a0
        0x16a8fb -> :sswitch_96
    .end sparse-switch

    :pswitch_data_14a
    .packed-switch 0x0
        :pswitch_b5
        :pswitch_e4
        :pswitch_114
    .end packed-switch
.end method

.method public fetchTrackById(Ljava/lang/Long;)Lsergentum/export/core/Model$Track;
    .registers 8
    .param p1, "trackId"    # Ljava/lang/Long;

    .prologue
    .line 164
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {p0, v4, v5}, Lsergentum/export/MifitStarter;->readRawDataWithId(J)Lsergentum/export/core/RawData$QueryData;

    move-result-object v0

    .line 166
    .local v0, "queryData":Lsergentum/export/core/RawData$QueryData;
    new-instance v2, Lsergentum/export/core/TrackExporter;

    invoke-direct {v2, p0}, Lsergentum/export/core/TrackExporter;-><init>(Lsergentum/export/Starter;)V

    .line 167
    .local v2, "trackExporter":Lsergentum/export/core/TrackExporter;
    invoke-virtual {v2, v0}, Lsergentum/export/core/TrackExporter;->compileTrack(Lsergentum/export/core/RawData$QueryData;)Lsergentum/export/core/Model$Track;

    move-result-object v1

    .line 168
    .local v1, "track":Lsergentum/export/core/Model$Track;
    return-object v1
.end method

.method public bridge synthetic loadTrackSummaryFromDb()Ljava/util/Map;
    .registers 2

    .prologue
    .line 36
    invoke-virtual {p0}, Lsergentum/export/MifitStarter;->loadTrackSummaryFromDb()Ljava/util/TreeMap;

    move-result-object v0

    return-object v0
.end method

.method public loadTrackSummaryFromDb()Ljava/util/TreeMap;
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/TreeMap",
            "<",
            "Ljava/lang/Long;",
            "Lsergentum/export/core/Model$TrackSummary;",
            ">;"
        }
    .end annotation

    .prologue
    .line 68
    new-instance v13, Ljava/util/TreeMap;

    invoke-direct {v13}, Ljava/util/TreeMap;-><init>()V

    .line 69
    .local v13, "trackSummaryMap":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Long;Lsergentum/export/core/Model$TrackSummary;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/MifitStarter;->dbPath:Ljava/lang/String;

    move-object/from16 v16, v0

    if-nez v16, :cond_49

    .line 70
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/MifitStarter;->activity:Landroid/app/Activity;

    move-object/from16 v16, v0

    const-string v17, "database not found"

    const/16 v18, 0x0

    invoke-static/range {v16 .. v18}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Landroid/widget/Toast;->show()V

    .line 107
    :cond_1e
    :goto_1e
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "trackHeaderMap.size(): "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v13}, Ljava/util/TreeMap;->size()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 108
    return-object v13

    .line 73
    :cond_49
    :try_start_49
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/MifitStarter;->activity:Landroid/app/Activity;

    move-object/from16 v16, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/export/MifitStarter;->dbPath:Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-virtual/range {v16 .. v19}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_5c} :catch_136

    move-result-object v9

    .line 72
    .local v9, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const/16 v18, 0x0

    .line 74
    :try_start_5f
    const-string v16, "   SELECT        TRACKRECORD.TRACKID,       TRACKDATA.TYPE,       TRACKRECORD.DISTANCE,       TRACKRECORD.COSTTIME       FROM TRACKDATA, TRACKRECORD       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;"

    const/16 v17, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v9, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_6a
    .catch Ljava/lang/Throwable; {:try_start_5f .. :try_end_6a} :catch_125
    .catchall {:try_start_5f .. :try_end_6a} :catchall_1a3

    move-result-object v2

    .line 72
    .local v2, "cursor":Landroid/database/Cursor;
    const/16 v17, 0x0

    .line 76
    :try_start_6d
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    .line 77
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .local v11, "stringBuilder":Ljava/lang/StringBuilder;
    :goto_75
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v16

    if-nez v16, :cond_163

    .line 79
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_7c
    invoke-interface {v2}, Landroid/database/Cursor;->getColumnCount()I

    move-result v16

    move/from16 v0, v16

    if-ge v5, v0, :cond_bc

    .line 80
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v19, " "

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    if-nez v5, :cond_b9

    .line 82
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 83
    .local v10, "string":Ljava/lang/String;
    invoke-static {v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    .line 84
    .local v6, "l":J
    new-instance v3, Ljava/util/Date;

    const-wide/16 v20, 0x3e8

    mul-long v20, v20, v6

    move-wide/from16 v0, v20

    invoke-direct {v3, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 85
    .local v3, "date":Ljava/util/Date;
    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v19, " "

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .end local v3    # "date":Ljava/util/Date;
    .end local v6    # "l":J
    .end local v10    # "string":Ljava/lang/String;
    :cond_b9
    add-int/lit8 v5, v5, 0x1

    goto :goto_7c

    .line 88
    :cond_bc
    const-string v16, "\n"

    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    new-instance v12, Lsergentum/export/core/Model$TrackSummary;

    invoke-direct {v12}, Lsergentum/export/core/Model$TrackSummary;-><init>()V

    .line 91
    .local v12, "trackHeader":Lsergentum/export/core/Model$TrackSummary;
    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    .line 92
    .local v14, "trackId":J
    iput-wide v14, v12, Lsergentum/export/core/Model$TrackSummary;->id:J

    .line 93
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 94
    .local v8, "miSportType":I
    sget-object v16, Lsergentum/export/core/TrackExporter;->mi2sport:Ljava/util/HashMap;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lsergentum/export/core/Model$ActivityType;

    move-object/from16 v0, v16

    iput-object v0, v12, Lsergentum/export/core/Model$TrackSummary;->activityType:Lsergentum/export/core/Model$ActivityType;

    .line 95
    const/16 v16, 0x2

    move/from16 v0, v16

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    move/from16 v0, v16

    iput v0, v12, Lsergentum/export/core/Model$TrackSummary;->distance:I

    .line 96
    const/16 v16, 0x3

    move/from16 v0, v16

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    move/from16 v0, v16

    iput v0, v12, Lsergentum/export/core/Model$TrackSummary;->duration:I

    .line 97
    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v13, v0, v12}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_112
    .catch Ljava/lang/Throwable; {:try_start_6d .. :try_end_112} :catch_114
    .catchall {:try_start_6d .. :try_end_112} :catchall_1ca

    goto/16 :goto_75

    .line 72
    .end local v5    # "i":I
    .end local v8    # "miSportType":I
    .end local v11    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v12    # "trackHeader":Lsergentum/export/core/Model$TrackSummary;
    .end local v14    # "trackId":J
    :catch_114
    move-exception v16

    :try_start_115
    throw v16
    :try_end_116
    .catchall {:try_start_115 .. :try_end_116} :catchall_116

    .line 103
    :catchall_116
    move-exception v17

    move-object/from16 v22, v17

    move-object/from16 v17, v16

    move-object/from16 v16, v22

    :goto_11d
    if-eqz v2, :cond_124

    if-eqz v17, :cond_1b5

    :try_start_121
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_124
    .catch Ljava/lang/Throwable; {:try_start_121 .. :try_end_124} :catch_1ab
    .catchall {:try_start_121 .. :try_end_124} :catchall_1a3

    :cond_124
    :goto_124
    :try_start_124
    throw v16
    :try_end_125
    .catch Ljava/lang/Throwable; {:try_start_124 .. :try_end_125} :catch_125
    .catchall {:try_start_124 .. :try_end_125} :catchall_1a3

    .line 72
    .end local v2    # "cursor":Landroid/database/Cursor;
    :catch_125
    move-exception v16

    :try_start_126
    throw v16
    :try_end_127
    .catchall {:try_start_126 .. :try_end_127} :catchall_127

    .line 103
    :catchall_127
    move-exception v17

    move-object/from16 v22, v17

    move-object/from16 v17, v16

    move-object/from16 v16, v22

    :goto_12e
    if-eqz v9, :cond_135

    if-eqz v17, :cond_1c5

    :try_start_132
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_135
    .catch Ljava/lang/Throwable; {:try_start_132 .. :try_end_135} :catch_1bf
    .catch Ljava/lang/Exception; {:try_start_132 .. :try_end_135} :catch_136

    :cond_135
    :goto_135
    :try_start_135
    throw v16
    :try_end_136
    .catch Ljava/lang/Exception; {:try_start_135 .. :try_end_136} :catch_136

    .end local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :catch_136
    move-exception v4

    .line 104
    .local v4, "e":Ljava/lang/Exception;
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "showTracks():"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    goto/16 :goto_1e

    .line 100
    .end local v4    # "e":Ljava/lang/Exception;
    .restart local v2    # "cursor":Landroid/database/Cursor;
    .restart local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v11    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_163
    :try_start_163
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 101
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 102
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    const/16 v19, 0x0

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v16, v19

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z
    :try_end_180
    .catch Ljava/lang/Throwable; {:try_start_163 .. :try_end_180} :catch_114
    .catchall {:try_start_163 .. :try_end_180} :catchall_1ca

    .line 103
    if-eqz v2, :cond_187

    if-eqz v17, :cond_1a7

    :try_start_184
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_187
    .catch Ljava/lang/Throwable; {:try_start_184 .. :try_end_187} :catch_19a
    .catchall {:try_start_184 .. :try_end_187} :catchall_1a3

    :cond_187
    :goto_187
    if-eqz v9, :cond_1e

    if-eqz v18, :cond_1ba

    :try_start_18b
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_18e
    .catch Ljava/lang/Throwable; {:try_start_18b .. :try_end_18e} :catch_190
    .catch Ljava/lang/Exception; {:try_start_18b .. :try_end_18e} :catch_136

    goto/16 :goto_1e

    :catch_190
    move-exception v16

    :try_start_191
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_198
    .catch Ljava/lang/Exception; {:try_start_191 .. :try_end_198} :catch_136

    goto/16 :goto_1e

    :catch_19a
    move-exception v16

    :try_start_19b
    move-object/from16 v0, v17

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_187

    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v11    # "stringBuilder":Ljava/lang/StringBuilder;
    :catchall_1a3
    move-exception v16

    move-object/from16 v17, v18

    goto :goto_12e

    .restart local v2    # "cursor":Landroid/database/Cursor;
    .restart local v11    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_1a7
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    goto :goto_187

    .end local v11    # "stringBuilder":Ljava/lang/StringBuilder;
    :catch_1ab
    move-exception v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_124

    :cond_1b5
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_1b8
    .catch Ljava/lang/Throwable; {:try_start_19b .. :try_end_1b8} :catch_125
    .catchall {:try_start_19b .. :try_end_1b8} :catchall_1a3

    goto/16 :goto_124

    .restart local v11    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_1ba
    :try_start_1ba
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto/16 :goto_1e

    .end local v2    # "cursor":Landroid/database/Cursor;
    .end local v11    # "stringBuilder":Ljava/lang/StringBuilder;
    :catch_1bf
    move-exception v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto/16 :goto_135

    :cond_1c5
    invoke-virtual {v9}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_1c8
    .catch Ljava/lang/Exception; {:try_start_1ba .. :try_end_1c8} :catch_136

    goto/16 :goto_135

    .restart local v2    # "cursor":Landroid/database/Cursor;
    :catchall_1ca
    move-exception v16

    goto/16 :goto_11d
.end method

.method public varargs log([Ljava/lang/String;)Z
    .registers 9
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 307
    invoke-super {p0, p1}, Lsergentum/export/Starter;->stringArrayToString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 308
    .local v0, "arrAsSingleString":Ljava/lang/String;
    :try_start_5
    new-instance v2, Ljava/io/FileWriter;

    iget-object v4, p0, Lsergentum/export/MifitStarter;->logFilePath:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-direct {v2, v4, v5}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_d} :catch_26
    .catchall {:try_start_5 .. :try_end_d} :catchall_39

    .local v2, "fileWriter":Ljava/io/FileWriter;
    const/4 v4, 0x0

    .line 309
    :try_start_e
    invoke-virtual {v2, v0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 310
    invoke-virtual {v2}, Ljava/io/FileWriter;->flush()V
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_14} :catch_40
    .catchall {:try_start_e .. :try_end_14} :catchall_57

    .line 311
    if-eqz v2, :cond_1b

    if-eqz v4, :cond_35

    :try_start_18
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_1b} :catch_21
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_26
    .catchall {:try_start_18 .. :try_end_1b} :catchall_39

    .line 315
    :cond_1b
    :goto_1b
    const-string v4, "mifit"

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    .end local v2    # "fileWriter":Ljava/io/FileWriter;
    :goto_20
    return v3

    .line 311
    .restart local v2    # "fileWriter":Ljava/io/FileWriter;
    :catch_21
    move-exception v5

    :try_start_22
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_25} :catch_26
    .catchall {:try_start_22 .. :try_end_25} :catchall_39

    goto :goto_1b

    .end local v2    # "fileWriter":Ljava/io/FileWriter;
    :catch_26
    move-exception v1

    .line 312
    .local v1, "e":Ljava/lang/Exception;
    :try_start_27
    const-string v3, "mifit"

    const-string v4, "Ex while logging:"

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2e
    .catchall {:try_start_27 .. :try_end_2e} :catchall_39

    .line 313
    const/4 v3, 0x0

    .line 315
    const-string v4, "mifit"

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_20

    .line 311
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v2    # "fileWriter":Ljava/io/FileWriter;
    :cond_35
    :try_start_35
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_38} :catch_26
    .catchall {:try_start_35 .. :try_end_38} :catchall_39

    goto :goto_1b

    .line 315
    .end local v2    # "fileWriter":Ljava/io/FileWriter;
    :catchall_39
    move-exception v3

    const-string v4, "mifit"

    invoke-static {v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    throw v3

    .line 308
    .restart local v2    # "fileWriter":Ljava/io/FileWriter;
    :catch_40
    move-exception v3

    :try_start_41
    throw v3
    :try_end_42
    .catchall {:try_start_41 .. :try_end_42} :catchall_42

    .line 311
    :catchall_42
    move-exception v4

    move-object v6, v4

    move-object v4, v3

    move-object v3, v6

    :goto_46
    if-eqz v2, :cond_4d

    if-eqz v4, :cond_53

    :try_start_4a
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_4d} :catch_4e
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4d} :catch_26
    .catchall {:try_start_4a .. :try_end_4d} :catchall_39

    :cond_4d
    :goto_4d
    :try_start_4d
    throw v3

    :catch_4e
    move-exception v5

    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4d

    :cond_53
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_56} :catch_26
    .catchall {:try_start_4d .. :try_end_56} :catchall_39

    goto :goto_4d

    :catchall_57
    move-exception v3

    goto :goto_46
.end method

.method public readRawDataWithId(J)Lsergentum/export/core/RawData$QueryData;
    .registers 20
    .param p1, "id"    # J

    .prologue
    .line 207
    new-instance v7, Lsergentum/export/core/RawData$QueryData;

    invoke-direct {v7}, Lsergentum/export/core/RawData$QueryData;-><init>()V

    .line 209
    .local v7, "queryData":Lsergentum/export/core/RawData$QueryData;
    :try_start_5
    move-object/from16 v0, p0

    iget-object v9, v0, Lsergentum/export/MifitStarter;->activity:Landroid/app/Activity;

    move-object/from16 v0, p0

    iget-object v10, v0, Lsergentum/export/MifitStarter;->dbPath:Ljava/lang/String;

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual {v9, v10, v11, v12}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_12} :catch_8f

    move-result-object v8

    .line 208
    .local v8, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v11, 0x0

    .line 210
    :try_start_14
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SELECT TRACKDATA.TRACKID,TRACKDATA.SIZE,TRACKDATA.BULKLL,TRACKDATA.BULKGAIT,TRACKDATA.BULKAL,TRACKDATA.BULKTIME,TRACKDATA.BULKHR,TRACKDATA.BULKPACE,TRACKDATA.BULKPAUSE,TRACKDATA.BULKSPEED,TRACKDATA.TYPE,TRACKDATA.BULKFLAG,TRACKRECORD.COSTTIME,TRACKRECORD.ENDTIME, TRACKRECORD.DISTANCE FROM TRACKDATA, TRACKRECORD WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID AND TRACKDATA.TRACKID = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-wide/from16 v0, p1

    invoke-virtual {v9, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v8, v9, v10}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_2d} :catch_81
    .catchall {:try_start_14 .. :try_end_2d} :catchall_c3

    move-result-object v4

    .line 208
    .local v4, "cursor":Landroid/database/Cursor;
    const/4 v10, 0x0

    .line 212
    :try_start_2f
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 213
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v9

    if-nez v9, :cond_4d

    .line 214
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_39
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnCount()I

    move-result v9

    if-ge v6, v9, :cond_6d

    .line 215
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 216
    .local v3, "columnValue":Ljava/lang/String;
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    .line 217
    .local v2, "columnName":Ljava/lang/String;
    invoke-static {v7, v2, v3}, Lsergentum/export/MifitStarter;->mapRawDataToQueryData(Lsergentum/export/core/RawData$QueryData;Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    add-int/lit8 v6, v6, 0x1

    goto :goto_39

    .line 220
    .end local v2    # "columnName":Ljava/lang/String;
    .end local v3    # "columnValue":Ljava/lang/String;
    .end local v6    # "i":I
    :cond_4d
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v12, 0x0

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "There is no track entry in db with such id: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-wide/from16 v0, p1

    invoke-virtual {v13, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    aput-object v13, v9, v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z
    :try_end_6d
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_6d} :catch_c6
    .catchall {:try_start_2f .. :try_end_6d} :catchall_ef

    .line 222
    :cond_6d
    if-eqz v4, :cond_74

    if-eqz v10, :cond_bf

    :try_start_71
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_74
    .catch Ljava/lang/Throwable; {:try_start_71 .. :try_end_74} :catch_7c
    .catchall {:try_start_71 .. :try_end_74} :catchall_c3

    :cond_74
    :goto_74
    if-eqz v8, :cond_7b

    if-eqz v11, :cond_e2

    :try_start_78
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_7b
    .catch Ljava/lang/Throwable; {:try_start_78 .. :try_end_7b} :catch_dd
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_7b} :catch_8f

    .line 225
    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :cond_7b
    :goto_7b
    return-object v7

    .line 222
    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v8    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :catch_7c
    move-exception v9

    :try_start_7d
    invoke-virtual {v10, v9}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_80
    .catch Ljava/lang/Throwable; {:try_start_7d .. :try_end_80} :catch_81
    .catchall {:try_start_7d .. :try_end_80} :catchall_c3

    goto :goto_74

    .line 208
    .end local v4    # "cursor":Landroid/database/Cursor;
    :catch_81
    move-exception v9

    :try_start_82
    throw v9
    :try_end_83
    .catchall {:try_start_82 .. :try_end_83} :catchall_83

    .line 222
    :catchall_83
    move-exception v10

    move-object v15, v10

    move-object v10, v9

    move-object v9, v15

    :goto_87
    if-eqz v8, :cond_8e

    if-eqz v10, :cond_eb

    :try_start_8b
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_8e
    .catch Ljava/lang/Throwable; {:try_start_8b .. :try_end_8e} :catch_e6
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_8e} :catch_8f

    :cond_8e
    :goto_8e
    :try_start_8e
    throw v9
    :try_end_8f
    .catch Ljava/lang/Exception; {:try_start_8e .. :try_end_8f} :catch_8f

    .end local v8    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :catch_8f
    move-exception v5

    .line 223
    .local v5, "e":Ljava/lang/Exception;
    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "readRawDataWithId("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-wide/from16 v0, p1

    invoke-virtual {v11, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "):"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v5}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lsergentum/export/MifitStarter;->log([Ljava/lang/String;)Z

    goto :goto_7b

    .line 222
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v8    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :cond_bf
    :try_start_bf
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_c2
    .catch Ljava/lang/Throwable; {:try_start_bf .. :try_end_c2} :catch_81
    .catchall {:try_start_bf .. :try_end_c2} :catchall_c3

    goto :goto_74

    .end local v4    # "cursor":Landroid/database/Cursor;
    :catchall_c3
    move-exception v9

    move-object v10, v11

    goto :goto_87

    .line 208
    .restart local v4    # "cursor":Landroid/database/Cursor;
    :catch_c6
    move-exception v9

    :try_start_c7
    throw v9
    :try_end_c8
    .catchall {:try_start_c7 .. :try_end_c8} :catchall_c8

    .line 222
    :catchall_c8
    move-exception v10

    move-object v15, v10

    move-object v10, v9

    move-object v9, v15

    :goto_cc
    if-eqz v4, :cond_d3

    if-eqz v10, :cond_d9

    :try_start_d0
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_d3
    .catch Ljava/lang/Throwable; {:try_start_d0 .. :try_end_d3} :catch_d4
    .catchall {:try_start_d0 .. :try_end_d3} :catchall_c3

    :cond_d3
    :goto_d3
    :try_start_d3
    throw v9

    :catch_d4
    move-exception v12

    invoke-virtual {v10, v12}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_d3

    :cond_d9
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_dc
    .catch Ljava/lang/Throwable; {:try_start_d3 .. :try_end_dc} :catch_81
    .catchall {:try_start_d3 .. :try_end_dc} :catchall_c3

    goto :goto_d3

    :catch_dd
    move-exception v9

    :try_start_de
    invoke-virtual {v11, v9}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_7b

    :cond_e2
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto :goto_7b

    .end local v4    # "cursor":Landroid/database/Cursor;
    :catch_e6
    move-exception v11

    invoke-virtual {v10, v11}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_8e

    :cond_eb
    invoke-virtual {v8}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_ee
    .catch Ljava/lang/Exception; {:try_start_de .. :try_end_ee} :catch_8f

    goto :goto_8e

    .restart local v4    # "cursor":Landroid/database/Cursor;
    :catchall_ef
    move-exception v9

    goto :goto_cc
.end method

.method public showToast(Ljava/lang/String;I)V
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 322
    iget-object v0, p0, Lsergentum/export/MifitStarter;->activity:Landroid/app/Activity;

    invoke-static {v0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 323
    return-void
.end method

.method public showTracks()V
    .registers 13

    .prologue
    .line 112
    invoke-virtual {p0}, Lsergentum/export/MifitStarter;->loadTrackSummaryFromDb()Ljava/util/TreeMap;

    move-result-object v8

    .line 114
    .local v8, "trackSummaryTreeMap":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/Long;Lsergentum/export/core/Model$TrackSummary;>;"
    const/4 v4, 0x1

    .line 115
    .local v4, "settingsScreenExist":Z
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .local v7, "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    invoke-virtual {v8}, Ljava/util/TreeMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/NavigableMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 118
    .local v1, "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackSummary;>;>;"
    const/4 v3, 0x0

    .line 120
    .local v3, "i":I
    if-eqz v4, :cond_53

    .line 122
    const-wide/16 v10, 0x0

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 123
    invoke-virtual {v8}, Ljava/util/TreeMap;->size()I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    new-array v6, v9, [Ljava/lang/String;

    .line 124
    .local v6, "trackDesc":[Ljava/lang/String;
    const/4 v9, 0x0

    const-string v10, "-- export settings --"

    aput-object v10, v6, v9

    .line 126
    add-int/lit8 v3, v3, 0x1

    .line 131
    :goto_2d
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_31
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5a

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 132
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackSummary;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 133
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lsergentum/export/core/Model$TrackSummary;

    invoke-virtual {v9}, Lsergentum/export/core/Model$TrackSummary;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v3

    .line 134
    add-int/lit8 v3, v3, 0x1

    .line 135
    goto :goto_31

    .line 128
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lsergentum/export/core/Model$TrackSummary;>;"
    .end local v6    # "trackDesc":[Ljava/lang/String;
    :cond_53
    invoke-virtual {v8}, Ljava/util/TreeMap;->size()I

    move-result v9

    new-array v6, v9, [Ljava/lang/String;

    .restart local v6    # "trackDesc":[Ljava/lang/String;
    goto :goto_2d

    .line 137
    :cond_5a
    new-instance v5, Lsergentum/export/MifitStarter$ChooseTrackClickListener;

    invoke-direct {v5, p0, v7}, Lsergentum/export/MifitStarter$ChooseTrackClickListener;-><init>(Lsergentum/export/MifitStarter;Ljava/util/ArrayList;)V

    .line 139
    .local v5, "trackChooseListener":Lsergentum/export/MifitStarter$ChooseTrackClickListener;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v9, p0, Lsergentum/export/MifitStarter;->activity:Landroid/app/Activity;

    invoke-direct {v0, v9}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 140
    .local v0, "alert":Landroid/app/AlertDialog$Builder;
    const-string v9, "Choose track to export:"

    invoke-virtual {v0, v9}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 141
    invoke-virtual {v0, v6, v5}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 142
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v9

    invoke-virtual {v9}, Landroid/app/AlertDialog;->show()V

    .line 143
    return-void
.end method
