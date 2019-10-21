.class Lsergentum/export/SettingsActivity$AuthTask;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsergentum/export/SettingsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AuthTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<",
        "Lsergentum/sync/Response;",
        ">;"
    }
.end annotation


# instance fields
.field private params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    iput-object p1, p0, Lsergentum/export/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    .line 124
    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 119
    invoke-virtual {p0}, Lsergentum/export/SettingsActivity$AuthTask;->call()Lsergentum/sync/Response;

    move-result-object v0

    return-object v0
.end method

.method public call()Lsergentum/sync/Response;
    .registers 12

    .prologue
    .line 128
    new-instance v6, Lsergentum/sync/Response;

    invoke-direct {v6}, Lsergentum/sync/Response;-><init>()V

    .line 130
    .local v6, "response":Lsergentum/sync/Response;
    :try_start_5
    new-instance v4, Lsergentum/sync/util/FormValues;

    invoke-direct {v4}, Lsergentum/sync/util/FormValues;-><init>()V

    .line 131
    .local v4, "kv":Lsergentum/sync/util/FormValues;
    const-string v8, "email"

    iget-object v9, p0, Lsergentum/export/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v10, "endomondo_login"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lsergentum/sync/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    const-string v8, "password"

    iget-object v9, p0, Lsergentum/export/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v10, "endomondo_password"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lsergentum/sync/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 133
    const-string v8, "v"

    const-string v9, "2.4"

    invoke-virtual {v4, v8, v9}, Lsergentum/sync/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    const-string v8, "action"

    const-string v9, "pair"

    invoke-virtual {v4, v8, v9}, Lsergentum/sync/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v8, "deviceId"

    iget-object v9, p0, Lsergentum/export/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v10, "deviceId"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lsergentum/sync/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v8, "country"

    const-string v9, "N/A"

    invoke-virtual {v4, v8, v9}, Lsergentum/sync/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const/4 v1, 0x0

    .line 139
    .local v1, "conn":Ljava/net/HttpURLConnection;
    new-instance v8, Ljava/net/URL;

    const-string v9, "https://api.mobile.endomondo.com/mobile/auth"

    invoke-direct {v8, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 140
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 141
    sget-object v8, Lsergentum/sync/DefSynchronizer$RequestMethod;->POST:Lsergentum/sync/DefSynchronizer$RequestMethod;

    invoke-virtual {v8}, Lsergentum/sync/DefSynchronizer$RequestMethod;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 142
    const-string v8, "Content-Type"

    const-string v9, "application/x-www-form-urlencoded"

    invoke-virtual {v1, v8, v9}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    invoke-static {v1, v4}, Lsergentum/sync/util/SyncHelper;->postData(Ljava/net/HttpURLConnection;Lsergentum/sync/util/FormValues;)V

    .line 145
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 146
    .local v3, "in":Ljava/io/BufferedReader;
    invoke-static {v3}, Lsergentum/export/SettingsActivity;->access$200(Ljava/io/BufferedReader;)Lorg/json/JSONObject;

    move-result-object v5

    .line 147
    .local v5, "res":Lorg/json/JSONObject;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 149
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    .line 150
    .local v7, "responseCode":I
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "amsg":Ljava/lang/String;
    const/16 v8, 0xc8

    if-ne v7, v8, :cond_b2

    const-string v8, "OK"

    const-string v9, "_0"

    .line 152
    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_b2

    const-string v8, "authToken"

    .line 153
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_b2

    .line 155
    const-string v8, "authToken"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Lsergentum/sync/Response;->apikey:Ljava/lang/String;

    .line 156
    const/4 v8, 0x1

    iput-boolean v8, v6, Lsergentum/sync/Response;->result:Z

    .line 157
    const-string v8, "Successfully logged in"

    iput-object v8, v6, Lsergentum/sync/Response;->message:Ljava/lang/String;

    .line 165
    .end local v0    # "amsg":Ljava/lang/String;
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "kv":Lsergentum/sync/util/FormValues;
    .end local v5    # "res":Lorg/json/JSONObject;
    .end local v7    # "responseCode":I
    :goto_b1
    return-object v6

    .line 159
    .restart local v0    # "amsg":Ljava/lang/String;
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "kv":Lsergentum/sync/util/FormValues;
    .restart local v5    # "res":Lorg/json/JSONObject;
    .restart local v7    # "responseCode":I
    :cond_b2
    const/4 v8, 0x0

    iput-boolean v8, v6, Lsergentum/sync/Response;->result:Z

    .line 160
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Can\'t log in: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Lsergentum/sync/Response;->message:Ljava/lang/String;
    :try_end_ca
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_ca} :catch_cb

    goto :goto_b1

    .line 162
    .end local v0    # "amsg":Ljava/lang/String;
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "kv":Lsergentum/sync/util/FormValues;
    .end local v5    # "res":Lorg/json/JSONObject;
    .end local v7    # "responseCode":I
    :catch_cb
    move-exception v2

    .line 163
    .local v2, "e":Ljava/lang/Exception;
    const-string v8, "mifit"

    const-string v9, "Exception occurred while connecting: "

    invoke-static {v8, v9, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b1
.end method
