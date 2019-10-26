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
    .line 105
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p1, p0, Lsergentum/export/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    .line 107
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
    .line 102
    invoke-virtual {p0}, Lsergentum/export/SettingsActivity$AuthTask;->call()Lsergentum/sync/Response;

    move-result-object v0

    return-object v0
.end method

.method public call()Lsergentum/sync/Response;
    .registers 14

    .prologue
    .line 111
    new-instance v8, Lsergentum/sync/Response;

    invoke-direct {v8}, Lsergentum/sync/Response;-><init>()V

    .line 113
    .local v8, "response":Lsergentum/sync/Response;
    :try_start_5
    new-instance v6, Lsergentum/util/FormValues;

    invoke-direct {v6}, Lsergentum/util/FormValues;-><init>()V

    .line 114
    .local v6, "kv":Lsergentum/util/FormValues;
    iget-object v10, p0, Lsergentum/export/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v11, "endomondo_login"

    invoke-interface {v10, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 115
    .local v3, "endomondo_login":Ljava/lang/String;
    iget-object v10, p0, Lsergentum/export/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v11, "endomondo_password"

    invoke-interface {v10, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 116
    .local v4, "endomondo_password":Ljava/lang/String;
    if-eqz v3, :cond_26

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_33

    .line 117
    :cond_26
    if-eqz v4, :cond_2e

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-eqz v10, :cond_33

    .line 118
    :cond_2e
    const-string v10, "login or password is empty"

    iput-object v10, v8, Lsergentum/sync/Response;->message:Ljava/lang/String;

    .line 156
    .end local v3    # "endomondo_login":Ljava/lang/String;
    .end local v4    # "endomondo_password":Ljava/lang/String;
    .end local v6    # "kv":Lsergentum/util/FormValues;
    :goto_32
    return-object v8

    .line 122
    .restart local v3    # "endomondo_login":Ljava/lang/String;
    .restart local v4    # "endomondo_password":Ljava/lang/String;
    .restart local v6    # "kv":Lsergentum/util/FormValues;
    :cond_33
    const-string v10, "email"

    invoke-virtual {v6, v10, v3}, Lsergentum/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    const-string v10, "password"

    invoke-virtual {v6, v10, v4}, Lsergentum/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    const-string v10, "v"

    const-string v11, "2.4"

    invoke-virtual {v6, v10, v11}, Lsergentum/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    const-string v10, "action"

    const-string v11, "pair"

    invoke-virtual {v6, v10, v11}, Lsergentum/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    const-string v10, "deviceId"

    iget-object v11, p0, Lsergentum/export/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v12, "deviceId"

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v6, v10, v11}, Lsergentum/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    const-string v10, "country"

    const-string v11, "N/A"

    invoke-virtual {v6, v10, v11}, Lsergentum/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    const/4 v1, 0x0

    .line 130
    .local v1, "conn":Ljava/net/HttpURLConnection;
    new-instance v10, Ljava/net/URL;

    const-string v11, "https://api.mobile.endomondo.com/mobile/auth"

    invoke-direct {v10, v11}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 131
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    const/4 v10, 0x1

    invoke-virtual {v1, v10}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 132
    sget-object v10, Lsergentum/sync/Synchronizer$RequestMethod;->POST:Lsergentum/sync/Synchronizer$RequestMethod;

    invoke-virtual {v10}, Lsergentum/sync/Synchronizer$RequestMethod;->name()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v1, v10}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 133
    const-string v10, "Content-Type"

    const-string v11, "application/x-www-form-urlencoded"

    invoke-virtual {v1, v10, v11}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    invoke-static {v1, v6}, Lsergentum/util/SyncHelper;->postData(Ljava/net/HttpURLConnection;Lsergentum/util/FormValues;)V

    .line 136
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v5, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 137
    .local v5, "in":Ljava/io/BufferedReader;
    invoke-static {v5}, Lsergentum/util/HttpUtil;->parseKVP(Ljava/io/BufferedReader;)Lorg/json/JSONObject;

    move-result-object v7

    .line 138
    .local v7, "res":Lorg/json/JSONObject;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 140
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v9

    .line 141
    .local v9, "responseCode":I
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v0

    .line 142
    .local v0, "amsg":Ljava/lang/String;
    const/16 v10, 0xc8

    if-ne v9, v10, :cond_d6

    const-string v10, "OK"

    const-string v11, "_0"

    .line 143
    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_d6

    const-string v10, "authToken"

    .line 144
    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_d6

    .line 146
    const-string v10, "authToken"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lsergentum/sync/Response;->apikey:Ljava/lang/String;

    .line 147
    const/4 v10, 0x1

    iput-boolean v10, v8, Lsergentum/sync/Response;->result:Z

    .line 148
    const-string v10, "Successfully logged in"

    iput-object v10, v8, Lsergentum/sync/Response;->message:Ljava/lang/String;
    :try_end_ca
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_ca} :catch_cc

    goto/16 :goto_32

    .line 153
    .end local v0    # "amsg":Ljava/lang/String;
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .end local v3    # "endomondo_login":Ljava/lang/String;
    .end local v4    # "endomondo_password":Ljava/lang/String;
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v6    # "kv":Lsergentum/util/FormValues;
    .end local v7    # "res":Lorg/json/JSONObject;
    .end local v9    # "responseCode":I
    :catch_cc
    move-exception v2

    .line 154
    .local v2, "e":Ljava/lang/Exception;
    const-string v10, "mifit"

    const-string v11, "Exception occurred while connecting: "

    invoke-static {v10, v11, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_32

    .line 150
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "amsg":Ljava/lang/String;
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    .restart local v3    # "endomondo_login":Ljava/lang/String;
    .restart local v4    # "endomondo_password":Ljava/lang/String;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "kv":Lsergentum/util/FormValues;
    .restart local v7    # "res":Lorg/json/JSONObject;
    .restart local v9    # "responseCode":I
    :cond_d6
    const/4 v10, 0x0

    :try_start_d7
    iput-boolean v10, v8, Lsergentum/sync/Response;->result:Z

    .line 151
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Can\'t log in: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v8, Lsergentum/sync/Response;->message:Ljava/lang/String;
    :try_end_ee
    .catch Ljava/lang/Exception; {:try_start_d7 .. :try_end_ee} :catch_cc

    goto/16 :goto_32
.end method
