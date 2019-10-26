.class public Lsergentum/sync/EndomondoSyncronizer;
.super Lsergentum/sync/Synchronizer;
.source "EndomondoSyncronizer.java"


# static fields
.field private static final UPLOAD_URL:Ljava/lang/String; = "https://api.mobile.endomondo.com/mobile/track"

.field private static final sport2endo:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lsergentum/export/core/Model$ActivityType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private authToken:Ljava/lang/String;

.field private starter:Lsergentum/export/Starter;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 42
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lsergentum/sync/EndomondoSyncronizer;->sport2endo:Ljava/util/Map;

    .line 46
    sget-object v0, Lsergentum/sync/EndomondoSyncronizer;->sport2endo:Ljava/util/Map;

    const/4 v1, 0x0

    const/16 v2, 0x16

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    sget-object v0, Lsergentum/sync/EndomondoSyncronizer;->sport2endo:Ljava/util/Map;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    sget-object v0, Lsergentum/sync/EndomondoSyncronizer;->sport2endo:Ljava/util/Map;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->CYCLING:Lsergentum/export/core/Model$ActivityType;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    sget-object v0, Lsergentum/sync/EndomondoSyncronizer;->sport2endo:Ljava/util/Map;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->WALKING:Lsergentum/export/core/Model$ActivityType;

    const/16 v2, 0x12

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    sget-object v0, Lsergentum/sync/EndomondoSyncronizer;->sport2endo:Ljava/util/Map;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->TREADMILL:Lsergentum/export/core/Model$ActivityType;

    const/16 v2, 0x58

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lsergentum/export/Starter;)V
    .registers 3
    .param p1, "authToken"    # Ljava/lang/String;
    .param p2, "starter"    # Lsergentum/export/Starter;

    .prologue
    .line 36
    invoke-direct {p0}, Lsergentum/sync/Synchronizer;-><init>()V

    .line 37
    iput-object p1, p0, Lsergentum/sync/EndomondoSyncronizer;->authToken:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lsergentum/sync/EndomondoSyncronizer;->starter:Lsergentum/export/Starter;

    .line 39
    return-void
.end method


# virtual methods
.method public upload(Lsergentum/export/core/Model$Track;)Lsergentum/sync/Synchronizer$Status;
    .registers 26
    .param p1, "track"    # Lsergentum/export/core/Model$Track;

    .prologue
    .line 56
    new-instance v19, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct/range {v19 .. v19}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual/range {v19 .. v19}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v10

    .line 57
    .local v10, "policy":Landroid/os/StrictMode$ThreadPolicy;
    invoke-static {v10}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    .line 59
    sget-object v13, Lsergentum/sync/Synchronizer$Status;->ERROR:Lsergentum/sync/Synchronizer$Status;

    .line 60
    .local v13, "status":Lsergentum/sync/Synchronizer$Status;
    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lsergentum/export/core/Model$TrackSummary;->toString()Ljava/lang/String;

    move-result-object v16

    .line 62
    .local v16, "trackDesc":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/sync/EndomondoSyncronizer;->authToken:Ljava/lang/String;

    move-object/from16 v19, v0

    if-eqz v19, :cond_30

    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/sync/EndomondoSyncronizer;->authToken:Ljava/lang/String;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->isEmpty()Z

    move-result v19

    if-eqz v19, :cond_3a

    .line 63
    :cond_30
    sget-object v13, Lsergentum/sync/Synchronizer$Status;->NEED_AUTH:Lsergentum/sync/Synchronizer$Status;

    .line 64
    const-string v19, "Please check Endomondo authorization in the settings"

    move-object/from16 v0, v19

    iput-object v0, v13, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;

    move-object v14, v13

    .line 151
    .end local v13    # "status":Lsergentum/sync/Synchronizer$Status;
    .local v14, "status":Lsergentum/sync/Synchronizer$Status;
    :goto_39
    return-object v14

    .line 71
    .end local v14    # "status":Lsergentum/sync/Synchronizer$Status;
    .restart local v13    # "status":Lsergentum/sync/Synchronizer$Status;
    :cond_3a
    :try_start_3a
    new-instance v18, Ljava/io/StringWriter;

    invoke-direct/range {v18 .. v18}, Ljava/io/StringWriter;-><init>()V

    .line 72
    .local v18, "writer":Ljava/io/StringWriter;
    invoke-static/range {p1 .. p1}, Lsergentum/export/core/Printer;->printEndomondoTrack(Lsergentum/export/core/Model$Track;)Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/io/StringWriter;->write(Ljava/lang/String;)V

    .line 73
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .local v17, "url":Ljava/lang/StringBuilder;
    const-string v19, "https://api.mobile.endomondo.com/mobile/track"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "?authToken="

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/sync/EndomondoSyncronizer;->authToken:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    const-string v19, "&workoutId="

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-wide v0, v0, Lsergentum/export/core/Model$TrackSummary;->startTime:J

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 76
    const-string v19, "&sport="

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    sget-object v20, Lsergentum/sync/EndomondoSyncronizer;->sport2endo:Ljava/util/Map;

    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lsergentum/export/core/Model$TrackSummary;->activityType:Lsergentum/export/core/Model$ActivityType;

    move-object/from16 v21, v0

    invoke-interface/range {v20 .. v21}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    const-string v19, "&duration="

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lsergentum/export/core/Model$TrackSummary;->duration:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    const-string v19, "&distance="

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lsergentum/export/core/Model$TrackSummary;->distance:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-double v0, v0

    move-wide/from16 v20, v0

    const-wide v22, 0x408f400000000000L    # 1000.0

    div-double v20, v20, v22

    invoke-virtual/range {v19 .. v21}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 86
    const-string v19, "&gzip=true"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const-string v19, "&extendedResponse=true"

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/sync/EndomondoSyncronizer;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lsergentum/export/Starter;->getDebug()Ljava/lang/Boolean;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v19

    if-eqz v19, :cond_16e

    .line 90
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-wide v0, v0, Lsergentum/export/core/Model$TrackSummary;->startTime:J

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "-"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lsergentum/export/core/Model$TrackSummary;->activityType:Lsergentum/export/core/Model$ActivityType;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ".txt"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 91
    .local v5, "fileName":Ljava/lang/String;
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lsergentum/export/Starter;->getDebugPath()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 92
    .local v6, "fullFilePath":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/sync/EndomondoSyncronizer;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v6}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 93
    move-object/from16 v0, p0

    iget-object v0, v0, Lsergentum/sync/EndomondoSyncronizer;->starter:Lsergentum/export/Starter;

    move-object/from16 v19, v0

    invoke-virtual/range {v18 .. v18}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v0, v1, v6}, Lsergentum/export/Starter;->writeStringToFile(Ljava/lang/String;Ljava/lang/String;)Z

    .line 96
    .end local v5    # "fileName":Ljava/lang/String;
    .end local v6    # "fullFilePath":Ljava/lang/String;
    :cond_16e
    new-instance v19, Ljava/net/URL;

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    .line 97
    .local v2, "conn":Ljava/net/HttpURLConnection;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 98
    sget-object v19, Lsergentum/sync/Synchronizer$RequestMethod;->POST:Lsergentum/sync/Synchronizer$RequestMethod;

    invoke-virtual/range {v19 .. v19}, Lsergentum/sync/Synchronizer$RequestMethod;->name()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 99
    const-string v19, "Content-Type"

    const-string v20, "application/octet-stream"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v2, v0, v1}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    new-instance v9, Ljava/util/zip/GZIPOutputStream;

    new-instance v19, Ljava/io/BufferedOutputStream;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object/from16 v0, v19

    invoke-direct {v9, v0}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 101
    .local v9, "out":Ljava/io/OutputStream;
    invoke-virtual/range {v18 .. v18}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/String;->getBytes()[B

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/io/OutputStream;->write([B)V

    .line 102
    invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V

    .line 103
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V

    .line 105
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v19, Ljava/io/InputStreamReader;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v19

    invoke-direct {v7, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 106
    .local v7, "in":Ljava/io/BufferedReader;
    invoke-static {v7}, Lsergentum/util/HttpUtil;->parseKVP(Ljava/io/BufferedReader;)Lorg/json/JSONObject;

    move-result-object v8

    .line 107
    .local v8, "jsonResponse":Lorg/json/JSONObject;
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 109
    const-string v19, "mifit"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "res: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v11

    .line 112
    .local v11, "responseCode":I
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v12

    .line 113
    .local v12, "responseMessage":Ljava/lang/String;
    const-string v19, "mifit"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "responseCode: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    const-string v19, "mifit"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "responseMessage: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    const/16 v19, 0xc8

    move/from16 v0, v19

    if-ne v11, v0, :cond_33e

    .line 118
    const-string v19, "_0"

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 119
    .local v4, "endomondoMessage":Ljava/lang/String;
    const-string v19, "OK"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v19

    if-eqz v19, :cond_303

    .line 121
    const-string v19, "workout.id"

    move-object/from16 v0, v19

    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 122
    .local v15, "string":Ljava/lang/String;
    const-string v19, "null"

    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-nez v19, :cond_2c3

    .line 123
    sget-object v13, Lsergentum/sync/Synchronizer$Status;->OK:Lsergentum/sync/Synchronizer$Status;

    .line 124
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\n uploaded"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    iput-object v0, v13, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;
    :try_end_277
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_277} :catch_2e1

    .line 145
    .end local v2    # "conn":Ljava/net/HttpURLConnection;
    .end local v4    # "endomondoMessage":Ljava/lang/String;
    .end local v7    # "in":Ljava/io/BufferedReader;
    .end local v8    # "jsonResponse":Lorg/json/JSONObject;
    .end local v9    # "out":Ljava/io/OutputStream;
    .end local v11    # "responseCode":I
    .end local v12    # "responseMessage":Ljava/lang/String;
    .end local v15    # "string":Ljava/lang/String;
    .end local v17    # "url":Ljava/lang/StringBuilder;
    .end local v18    # "writer":Ljava/io/StringWriter;
    :goto_277
    iget-object v0, v13, Lsergentum/sync/Synchronizer$Status;->ex:Ljava/lang/Exception;

    move-object/from16 v19, v0

    if-eqz v19, :cond_2a4

    .line 146
    const-string v19, "mifit"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    iget-object v0, v13, Lsergentum/sync/Synchronizer$Status;->ex:Ljava/lang/Exception;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    iget-object v0, v13, Lsergentum/sync/Synchronizer$Status;->ex:Ljava/lang/Exception;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Exception;->printStackTrace()V

    .line 149
    :cond_2a4
    const-string v19, "mifit"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, ""

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual {v13}, Lsergentum/sync/Synchronizer$Status;->toConsoleString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-object v14, v13

    .line 151
    .end local v13    # "status":Lsergentum/sync/Synchronizer$Status;
    .restart local v14    # "status":Lsergentum/sync/Synchronizer$Status;
    goto/16 :goto_39

    .line 126
    .end local v14    # "status":Lsergentum/sync/Synchronizer$Status;
    .restart local v2    # "conn":Ljava/net/HttpURLConnection;
    .restart local v4    # "endomondoMessage":Ljava/lang/String;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "jsonResponse":Lorg/json/JSONObject;
    .restart local v9    # "out":Ljava/io/OutputStream;
    .restart local v11    # "responseCode":I
    .restart local v12    # "responseMessage":Ljava/lang/String;
    .restart local v13    # "status":Lsergentum/sync/Synchronizer$Status;
    .restart local v15    # "string":Ljava/lang/String;
    .restart local v17    # "url":Ljava/lang/StringBuilder;
    .restart local v18    # "writer":Ljava/io/StringWriter;
    :cond_2c3
    :try_start_2c3
    sget-object v13, Lsergentum/sync/Synchronizer$Status;->SKIP:Lsergentum/sync/Synchronizer$Status;

    .line 127
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\n uploaded earlier"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    iput-object v0, v13, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;
    :try_end_2e0
    .catch Ljava/lang/Exception; {:try_start_2c3 .. :try_end_2e0} :catch_2e1

    goto :goto_277

    .line 140
    .end local v2    # "conn":Ljava/net/HttpURLConnection;
    .end local v4    # "endomondoMessage":Ljava/lang/String;
    .end local v7    # "in":Ljava/io/BufferedReader;
    .end local v8    # "jsonResponse":Lorg/json/JSONObject;
    .end local v9    # "out":Ljava/io/OutputStream;
    .end local v11    # "responseCode":I
    .end local v12    # "responseMessage":Ljava/lang/String;
    .end local v15    # "string":Ljava/lang/String;
    .end local v17    # "url":Ljava/lang/StringBuilder;
    .end local v18    # "writer":Ljava/io/StringWriter;
    :catch_2e1
    move-exception v3

    .line 141
    .local v3, "e":Ljava/lang/Exception;
    iput-object v3, v13, Lsergentum/sync/Synchronizer$Status;->ex:Ljava/lang/Exception;

    .line 142
    sget-object v13, Lsergentum/sync/Synchronizer$Status;->FAIL:Lsergentum/sync/Synchronizer$Status;

    .line 143
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "EndomondoSync FAIL \n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    iput-object v0, v13, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;

    goto/16 :goto_277

    .line 129
    .end local v3    # "e":Ljava/lang/Exception;
    .restart local v2    # "conn":Ljava/net/HttpURLConnection;
    .restart local v4    # "endomondoMessage":Ljava/lang/String;
    .restart local v7    # "in":Ljava/io/BufferedReader;
    .restart local v8    # "jsonResponse":Lorg/json/JSONObject;
    .restart local v9    # "out":Ljava/io/OutputStream;
    .restart local v11    # "responseCode":I
    .restart local v12    # "responseMessage":Ljava/lang/String;
    .restart local v17    # "url":Ljava/lang/StringBuilder;
    .restart local v18    # "writer":Ljava/io/StringWriter;
    :cond_303
    :try_start_303
    const-string v19, "AUTH_FAILED"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_317

    .line 130
    sget-object v13, Lsergentum/sync/Synchronizer$Status;->NEED_AUTH:Lsergentum/sync/Synchronizer$Status;

    .line 131
    const-string v19, "Authorization failed, check the settings"

    move-object/from16 v0, v19

    iput-object v0, v13, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;

    goto/16 :goto_277

    .line 133
    :cond_317
    sget-object v13, Lsergentum/sync/Synchronizer$Status;->ERROR:Lsergentum/sync/Synchronizer$Status;

    .line 134
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "There\'s some issue with track: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p1

    iget-object v0, v0, Lsergentum/export/core/Model$Track;->summary:Lsergentum/export/core/Model$TrackSummary;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-wide v0, v0, Lsergentum/export/core/Model$TrackSummary;->startTime:J

    move-wide/from16 v20, v0

    invoke-virtual/range {v19 .. v21}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    iput-object v0, v13, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;

    goto/16 :goto_277

    .line 137
    .end local v4    # "endomondoMessage":Ljava/lang/String;
    :cond_33e
    sget-object v13, Lsergentum/sync/Synchronizer$Status;->FAIL:Lsergentum/sync/Synchronizer$Status;

    .line 138
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Transmission FAILED\nHttpCode:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " Msg: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    iput-object v0, v13, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;
    :try_end_365
    .catch Ljava/lang/Exception; {:try_start_303 .. :try_end_365} :catch_2e1

    goto/16 :goto_277
.end method
