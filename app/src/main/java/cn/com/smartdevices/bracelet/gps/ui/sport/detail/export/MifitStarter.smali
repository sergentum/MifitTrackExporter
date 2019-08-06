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

    .line 40
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;-><init>()V

    .line 41
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    .line 42
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

    .line 43
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 44
    .local v1, "sp":Landroid/content/SharedPreferences;
    const-string v2, "export_format"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->FILE_FORMAT:Ljava/lang/String;

    .line 45
    const-string v2, "debug"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    sput-boolean v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->debug:Z

    .line 48
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    .line 50
    .local v0, "language":Ljava/lang/String;
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->checkFilePath()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 51
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->getDbPath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->dbPath:Ljava/lang/String;

    .line 56
    :goto_4c
    return-void

    .line 53
    :cond_4d
    const-string v2, "can\'t get access to filesystem"

    invoke-static {p1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 54
    const-string v2, "mifit"

    const-string v3, "can\'t get access to filesystem"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4c
.end method

.method static synthetic access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;)Landroid/app/Activity;
    .registers 2
    .param p0, "x0"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    .prologue
    .line 30
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method private checkExtDb()Ljava/lang/String;
    .registers 14

    .prologue
    const/4 v12, 0x1

    const/4 v8, 0x0

    .line 183
    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getFullPath()Ljava/lang/String;

    move-result-object v5

    .line 184
    .local v5, "mifit_dir_path":Ljava/lang/String;
    invoke-virtual {p0, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    .line 185
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 186
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

    .line 187
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_a9

    .line 189
    :try_start_2e
    invoke-virtual {v4}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v3

    .line 190
    .local v3, "list":[Ljava/lang/String;
    array-length v9, v3

    move v7, v8

    :goto_34
    if-ge v7, v9, :cond_a9

    aget-object v2, v3, v7

    .line 191
    .local v2, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
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

    .line 193
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 194
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

    .line 195
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

    .line 204
    .end local v0    # "curFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "list":[Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    :goto_86
    return-object v6

    .line 190
    .restart local v0    # "curFile":Ljava/io/File;
    .restart local v2    # "fileName":Ljava/lang/String;
    .restart local v3    # "list":[Ljava/lang/String;
    :cond_87
    add-int/lit8 v7, v7, 0x1

    goto :goto_34

    .line 199
    .end local v0    # "curFile":Ljava/io/File;
    .end local v2    # "fileName":Ljava/lang/String;
    .end local v3    # "list":[Ljava/lang/String;
    :catch_8a
    move-exception v1

    .line 200
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

    .line 203
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_a9
    new-array v7, v12, [Ljava/lang/String;

    const-string v9, "ext db not found"

    aput-object v9, v7, v8

    invoke-virtual {p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 204
    const/4 v6, 0x0

    goto :goto_86
.end method

.method private checkFilePath()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 241
    invoke-static {}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->getDebugPath()Ljava/lang/String;

    move-result-object v0

    .line 242
    .local v0, "filePath":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->checkIfPathExistAndCreate(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2b

    .line 243
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

    .line 244
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "."

    aput-object v3, v2, v1

    invoke-virtual {p0, v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    move-result v1

    .line 246
    :cond_2b
    return v1
.end method

.method private dbPathFinder()Ljava/lang/String;
    .registers 8

    .prologue
    const/4 v6, 0x0

    .line 231
    iget-object v3, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    const-string v4, "tmp.db"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v6, v5}, Landroid/app/Activity;->openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 232
    .local v0, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "CREATE TABLE IF NOT EXISTS dummy (\"_id\"  INTEGER primary key autoincrement, \n  \"CALENDAR\" INTEGER )"

    invoke-virtual {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 233
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->getPath()Ljava/lang/String;

    move-result-object v2

    .line 234
    .local v2, "tmpDbPath":Ljava/lang/String;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 235
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 236
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

    .line 237
    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private findOriginDb()Ljava/lang/String;
    .registers 16

    .prologue
    const/4 v14, 0x1

    const/4 v9, 0x0

    .line 208
    const-string v8, "^origin_db_[A-Za-z0-9]*$"

    invoke-static {v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    .line 210
    .local v7, "pattern":Ljava/util/regex/Pattern;
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->dbPathFinder()Ljava/lang/String;

    move-result-object v5

    .line 212
    .local v5, "pathToDb":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 213
    .local v2, "directory":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v4

    .line 215
    .local v4, "list":[Ljava/lang/String;
    array-length v10, v4

    move v8, v9

    :goto_17
    if-ge v8, v10, :cond_70

    aget-object v3, v4, v8

    .line 216
    .local v3, "file":Ljava/lang/String;
    invoke-virtual {v7, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    .line 217
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

    .line 218
    if-eqz v1, :cond_6d

    .line 219
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v5, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    .line 221
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

    .line 227
    .end local v0    # "dbFile":Ljava/io/File;
    .end local v1    # "dbFound":Z
    .end local v3    # "file":Ljava/lang/String;
    .end local v6    # "pathToOriginDb":Ljava/lang/String;
    :goto_6c
    return-object v6

    .line 215
    .restart local v1    # "dbFound":Z
    .restart local v3    # "file":Ljava/lang/String;
    :cond_6d
    add-int/lit8 v8, v8, 0x1

    goto :goto_17

    .line 226
    .end local v1    # "dbFound":Z
    .end local v3    # "file":Ljava/lang/String;
    :cond_70
    new-array v8, v14, [Ljava/lang/String;

    const-string v10, "origin db not found"

    aput-object v10, v8, v9

    invoke-virtual {p0, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z

    .line 227
    const/4 v6, 0x0

    goto :goto_6c
.end method

.method private getDbPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 174
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->checkExtDb()Ljava/lang/String;

    move-result-object v0

    .line 175
    .local v0, "result":Ljava/lang/String;
    if-nez v0, :cond_a

    .line 176
    invoke-direct {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->findOriginDb()Ljava/lang/String;

    move-result-object v0

    .line 178
    :cond_a
    return-object v0
.end method


# virtual methods
.method public loadTrackHeadersFromDb()Ljava/util/Map;
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
    .line 60
    move-object/from16 v0, p0

    iget-object v15, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->dbPath:Ljava/lang/String;

    if-nez v15, :cond_1b

    .line 61
    move-object/from16 v0, p0

    iget-object v15, v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    const-string v18, "database not found"

    const/16 v19, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v19

    invoke-static {v15, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v15

    invoke-virtual {v15}, Landroid/widget/Toast;->show()V

    .line 62
    const/4 v14, 0x0

    .line 98
    :cond_1a
    :goto_1a
    return-object v14

    .line 64
    :cond_1b
    new-instance v14, Ljava/util/TreeMap;

    invoke-direct {v14}, Ljava/util/TreeMap;-><init>()V

    .line 66
    .local v14, "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    :try_start_20
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
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_37} :catch_e2

    move-result-object v10

    .line 65
    .local v10, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const/16 v19, 0x0

    .line 67
    :try_start_3a
    const-string v15, "   SELECT        TRACKRECORD.TRACKID,       TRACKDATA.TYPE,       TRACKRECORD.DISTANCE,       TRACKRECORD.COSTTIME       FROM TRACKDATA, TRACKRECORD       WHERE TRACKDATA.TRACKID = TRACKRECORD.TRACKID ;"

    const/16 v18, 0x0

    move-object/from16 v0, v18

    invoke-virtual {v10, v15, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_3a .. :try_end_43} :catch_d1
    .catchall {:try_start_3a .. :try_end_43} :catchall_13d

    move-result-object v4

    .line 65
    .local v4, "cursor":Landroid/database/Cursor;
    const/16 v18, 0x0

    .line 69
    :try_start_46
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 70
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .local v12, "stringBuilder":Ljava/lang/StringBuilder;
    :goto_4e
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v15

    if-nez v15, :cond_108

    .line 72
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_55
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnCount()I

    move-result v15

    if-ge v7, v15, :cond_8d

    .line 73
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v20, " "

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    if-nez v7, :cond_8a

    .line 75
    invoke-interface {v4, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 76
    .local v11, "string":Ljava/lang/String;
    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 77
    .local v8, "l":J
    new-instance v5, Ljava/util/Date;

    const-wide/16 v20, 0x3e8

    mul-long v20, v20, v8

    move-wide/from16 v0, v20

    invoke-direct {v5, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 78
    .local v5, "date":Ljava/util/Date;
    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v20, " "

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .end local v5    # "date":Ljava/util/Date;
    .end local v8    # "l":J
    .end local v11    # "string":Ljava/lang/String;
    :cond_8a
    add-int/lit8 v7, v7, 0x1

    goto :goto_55

    .line 81
    :cond_8d
    const-string v15, "\n"

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    new-instance v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;

    invoke-direct {v13}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;-><init>()V

    .line 84
    .local v13, "trackHeader":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;
    const/4 v15, 0x0

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 85
    .local v16, "trackId":J
    move-wide/from16 v0, v16

    iput-wide v0, v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->id:J

    .line 86
    const/4 v15, 0x1

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    iput v15, v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->type:I

    .line 87
    const/4 v15, 0x2

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    iput v15, v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->distance:I

    .line 88
    const/4 v15, 0x3

    invoke-interface {v4, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    iput v15, v13, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->duration:I

    .line 89
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v15

    invoke-interface {v14, v15, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_bf
    .catch Ljava/lang/Throwable; {:try_start_46 .. :try_end_bf} :catch_c0
    .catchall {:try_start_46 .. :try_end_bf} :catchall_161

    goto :goto_4e

    .line 65
    .end local v7    # "i":I
    .end local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    .end local v13    # "trackHeader":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;
    .end local v16    # "trackId":J
    :catch_c0
    move-exception v15

    :try_start_c1
    throw v15
    :try_end_c2
    .catchall {:try_start_c1 .. :try_end_c2} :catchall_c2

    .line 95
    :catchall_c2
    move-exception v18

    move-object/from16 v22, v18

    move-object/from16 v18, v15

    move-object/from16 v15, v22

    :goto_c9
    if-eqz v4, :cond_d0

    if-eqz v18, :cond_14e

    :try_start_cd
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_d0
    .catch Ljava/lang/Throwable; {:try_start_cd .. :try_end_d0} :catch_145
    .catchall {:try_start_cd .. :try_end_d0} :catchall_13d

    :cond_d0
    :goto_d0
    :try_start_d0
    throw v15
    :try_end_d1
    .catch Ljava/lang/Throwable; {:try_start_d0 .. :try_end_d1} :catch_d1
    .catchall {:try_start_d0 .. :try_end_d1} :catchall_13d

    .line 65
    .end local v4    # "cursor":Landroid/database/Cursor;
    :catch_d1
    move-exception v15

    :try_start_d2
    throw v15
    :try_end_d3
    .catchall {:try_start_d2 .. :try_end_d3} :catchall_d3

    .line 95
    :catchall_d3
    move-exception v18

    move-object/from16 v22, v18

    move-object/from16 v18, v15

    move-object/from16 v15, v22

    :goto_da
    if-eqz v10, :cond_e1

    if-eqz v18, :cond_15d

    :try_start_de
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_e1
    .catch Ljava/lang/Throwable; {:try_start_de .. :try_end_e1} :catch_158
    .catch Ljava/lang/Exception; {:try_start_de .. :try_end_e1} :catch_e2

    :cond_e1
    :goto_e1
    :try_start_e1
    throw v15
    :try_end_e2
    .catch Ljava/lang/Exception; {:try_start_e1 .. :try_end_e2} :catch_e2

    .end local v10    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    :catch_e2
    move-exception v6

    .line 96
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

    goto/16 :goto_1a

    .line 92
    .end local v6    # "e":Ljava/lang/Exception;
    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v10    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    .restart local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_108
    :try_start_108
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 93
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 94
    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/String;

    const/16 v20, 0x0

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v15, v20

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->log([Ljava/lang/String;)Z
    :try_end_11e
    .catch Ljava/lang/Throwable; {:try_start_108 .. :try_end_11e} :catch_c0
    .catchall {:try_start_108 .. :try_end_11e} :catchall_161

    .line 95
    if-eqz v4, :cond_125

    if-eqz v18, :cond_141

    :try_start_122
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_125
    .catch Ljava/lang/Throwable; {:try_start_122 .. :try_end_125} :catch_136
    .catchall {:try_start_122 .. :try_end_125} :catchall_13d

    :cond_125
    :goto_125
    if-eqz v10, :cond_1a

    if-eqz v19, :cond_153

    :try_start_129
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_12c
    .catch Ljava/lang/Throwable; {:try_start_129 .. :try_end_12c} :catch_12e
    .catch Ljava/lang/Exception; {:try_start_129 .. :try_end_12c} :catch_e2

    goto/16 :goto_1a

    :catch_12e
    move-exception v15

    :try_start_12f
    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_134
    .catch Ljava/lang/Exception; {:try_start_12f .. :try_end_134} :catch_e2

    goto/16 :goto_1a

    :catch_136
    move-exception v15

    :try_start_137
    move-object/from16 v0, v18

    invoke-virtual {v0, v15}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_125

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :catchall_13d
    move-exception v15

    move-object/from16 v18, v19

    goto :goto_da

    .restart local v4    # "cursor":Landroid/database/Cursor;
    .restart local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_141
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    goto :goto_125

    .end local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :catch_145
    move-exception v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_d0

    :cond_14e
    invoke-interface {v4}, Landroid/database/Cursor;->close()V
    :try_end_151
    .catch Ljava/lang/Throwable; {:try_start_137 .. :try_end_151} :catch_d1
    .catchall {:try_start_137 .. :try_end_151} :catchall_13d

    goto/16 :goto_d0

    .restart local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_153
    :try_start_153
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    goto/16 :goto_1a

    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v12    # "stringBuilder":Ljava/lang/StringBuilder;
    :catch_158
    move-exception v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_e1

    :cond_15d
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->close()V
    :try_end_160
    .catch Ljava/lang/Exception; {:try_start_153 .. :try_end_160} :catch_e2

    goto :goto_e1

    .restart local v4    # "cursor":Landroid/database/Cursor;
    :catchall_161
    move-exception v15

    goto/16 :goto_c9
.end method

.method public varargs log([Ljava/lang/String;)Z
    .registers 9
    .param p1, "args"    # [Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 252
    invoke-super {p0, p1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->stringArrayToString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 253
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

    .line 254
    :try_start_e
    const-string v5, "mifit"

    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    invoke-virtual {v1, v2}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 256
    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V
    :try_end_19
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_19} :catch_49
    .catchall {:try_start_e .. :try_end_19} :catchall_60

    .line 257
    if-eqz v1, :cond_20

    if-eqz v4, :cond_45

    :try_start_1d
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_20} :catch_21
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_20} :catch_26

    .line 261
    .end local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_20
    :goto_20
    return v3

    .line 257
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

    .line 258
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

    .line 259
    const/4 v3, 0x0

    goto :goto_20

    .line 257
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "fileWriter":Ljava/io/FileWriter;
    :cond_45
    :try_start_45
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_48} :catch_26

    goto :goto_20

    .line 253
    :catch_49
    move-exception v3

    :try_start_4a
    throw v3
    :try_end_4b
    .catchall {:try_start_4a .. :try_end_4b} :catchall_4b

    .line 257
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

.method public readRawDataWithId(J)V
    .registers 20
    .param p1, "id"    # J

    .prologue
    .line 151
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

    .line 150
    .local v9, "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v13, 0x0

    .line 152
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

    .line 150
    .local v4, "cursor":Landroid/database/Cursor;
    const/4 v12, 0x0

    .line 154
    :try_start_2a
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    .line 155
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v8, "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v11

    if-nez v11, :cond_55

    .line 157
    new-instance v7, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;

    invoke-direct {v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;-><init>()V

    .line 158
    .local v7, "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3e
    invoke-interface {v4}, Landroid/database/Cursor;->getColumnCount()I

    move-result v11

    if-ge v6, v11, :cond_52

    .line 159
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 160
    .local v3, "columnValue":Ljava/lang/String;
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getColumnName(I)Ljava/lang/String;

    move-result-object v2

    .line 161
    .local v2, "columnName":Ljava/lang/String;
    invoke-static {v7, v2, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->mapRawDataToQueryData(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    add-int/lit8 v6, v6, 0x1

    goto :goto_3e

    .line 163
    .end local v2    # "columnName":Ljava/lang/String;
    .end local v3    # "columnValue":Ljava/lang/String;
    :cond_52
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    .end local v6    # "i":I
    .end local v7    # "queryData":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;
    :cond_55
    new-instance v10, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;

    move-object/from16 v0, p0

    invoke-direct {v10, v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;)V

    .line 166
    .local v10, "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    invoke-virtual {v10, v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;->launchExport(Ljava/util/ArrayList;)V
    :try_end_5f
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_5f} :catch_b8
    .catchall {:try_start_2a .. :try_end_5f} :catchall_e1

    .line 168
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

    .line 171
    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v9    # "sqLiteDatabase":Landroid/database/sqlite/SQLiteDatabase;
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :cond_6d
    :goto_6d
    return-void

    .line 168
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

    .line 150
    .end local v4    # "cursor":Landroid/database/Cursor;
    .end local v8    # "queryDataArrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/RawData$QueryData;>;"
    .end local v10    # "trackExporter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/TrackExporter;
    :catch_73
    move-exception v11

    :try_start_74
    throw v11
    :try_end_75
    .catchall {:try_start_74 .. :try_end_75} :catchall_75

    .line 168
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

    .line 169
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

    .line 168
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

    .line 150
    .restart local v4    # "cursor":Landroid/database/Cursor;
    :catch_b8
    move-exception v11

    :try_start_b9
    throw v11
    :try_end_ba
    .catchall {:try_start_b9 .. :try_end_ba} :catchall_ba

    .line 168
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

.method public showToast(Ljava/lang/String;I)V
    .registers 4
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "length"    # I

    .prologue
    .line 266
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    invoke-static {v0, p1, p2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 267
    return-void
.end method

.method public showTracks()V
    .registers 11

    .prologue
    .line 104
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->loadTrackHeadersFromDb()Ljava/util/Map;

    move-result-object v6

    .line 106
    .local v6, "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .local v7, "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    const-wide/16 v8, 0x0

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-interface {v6}, Ljava/util/Map;->size()I

    move-result v8

    add-int/lit8 v8, v8, 0x1

    new-array v5, v8, [Ljava/lang/String;

    .line 110
    .local v5, "trackDesc":[Ljava/lang/String;
    const/4 v8, 0x0

    const-string v9, "-- export settings --"

    aput-object v9, v5, v8

    .line 112
    check-cast v6, Ljava/util/TreeMap;

    .line 113
    .end local v6    # "trackHeaderMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    invoke-virtual {v6}, Ljava/util/TreeMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/NavigableMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 114
    .local v1, "entries":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;>;"
    const/4 v3, 0x1

    .line 115
    .local v3, "i":I
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_2e
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_50

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 116
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 117
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;

    invoke-virtual {v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v3

    .line 118
    add-int/lit8 v3, v3, 0x1

    .line 119
    goto :goto_2e

    .line 121
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Long;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/core/Model$TrackHeader;>;"
    :cond_50
    new-instance v4, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;

    invoke-direct {v4, p0, p0, v7}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;Ljava/util/ArrayList;)V

    .line 123
    .local v4, "trackChooseListener":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v8, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->activity:Landroid/app/Activity;

    invoke-direct {v0, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 124
    .local v0, "alert":Landroid/app/AlertDialog$Builder;
    const-string v8, "Choose track to export:"

    invoke-virtual {v0, v8}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 125
    invoke-virtual {v0, v5, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 126
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v8

    invoke-virtual {v8}, Landroid/app/AlertDialog;->show()V

    .line 127
    return-void
.end method
