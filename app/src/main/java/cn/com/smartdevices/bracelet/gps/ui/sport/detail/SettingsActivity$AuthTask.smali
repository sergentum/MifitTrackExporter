.class Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;
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
        "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;",
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
    .line 125
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    .line 127
    return-void
.end method


# virtual methods
.method public call()Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;
    .registers 12

    .prologue
    .line 131
    new-instance v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;

    invoke-direct {v6}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;-><init>()V

    .line 133
    .local v6, "response":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;
    :try_start_5
    new-instance v4, Lcom/example/username/mifittrackexporter/util/FormValues;

    invoke-direct {v4}, Lcom/example/username/mifittrackexporter/util/FormValues;-><init>()V

    .line 134
    .local v4, "kv":Lcom/example/username/mifittrackexporter/util/FormValues;
    const-string v8, "email"

    iget-object v9, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v10, "endomondo_login"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lcom/example/username/mifittrackexporter/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    const-string v8, "password"

    iget-object v9, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v10, "endomondo_password"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lcom/example/username/mifittrackexporter/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    const-string v8, "v"

    const-string v9, "2.4"

    invoke-virtual {v4, v8, v9}, Lcom/example/username/mifittrackexporter/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    const-string v8, "action"

    const-string v9, "pair"

    invoke-virtual {v4, v8, v9}, Lcom/example/username/mifittrackexporter/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    const-string v8, "deviceId"

    iget-object v9, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;->params:Ljava/util/Map;

    const-string v10, "deviceId"

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lcom/example/username/mifittrackexporter/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    const-string v8, "country"

    const-string v9, "N/A"

    invoke-virtual {v4, v8, v9}, Lcom/example/username/mifittrackexporter/util/FormValues;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    const/4 v1, 0x0

    .line 142
    .local v1, "conn":Ljava/net/HttpURLConnection;
    new-instance v8, Ljava/net/URL;

    const-string v9, "https://api.mobile.endomondo.com/mobile/auth"

    invoke-direct {v8, v9}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 143
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 144
    sget-object v8, Lcom/example/username/mifittrackexporter/DefSynchronizer$RequestMethod;->POST:Lcom/example/username/mifittrackexporter/DefSynchronizer$RequestMethod;

    invoke-virtual {v8}, Lcom/example/username/mifittrackexporter/DefSynchronizer$RequestMethod;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 145
    const-string v8, "Content-Type"

    const-string v9, "application/x-www-form-urlencoded"

    invoke-virtual {v1, v8, v9}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    invoke-static {v1, v4}, Lcom/example/username/mifittrackexporter/util/SyncHelper;->postData(Ljava/net/HttpURLConnection;Lcom/example/username/mifittrackexporter/util/FormValues;)V

    .line 148
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 149
    .local v3, "in":Ljava/io/BufferedReader;
    invoke-static {v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->access$200(Ljava/io/BufferedReader;)Lorg/json/JSONObject;

    move-result-object v5

    .line 150
    .local v5, "res":Lorg/json/JSONObject;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 152
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    .line 153
    .local v7, "responseCode":I
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "amsg":Ljava/lang/String;
    const/16 v8, 0xc8

    if-ne v7, v8, :cond_b2

    const-string v8, "OK"

    const-string v9, "_0"

    .line 155
    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_b2

    const-string v8, "authToken"

    .line 156
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_b2

    .line 158
    const-string v8, "authToken"

    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->apikey:Ljava/lang/String;

    .line 159
    const/4 v8, 0x1

    iput-boolean v8, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->result:Z

    .line 160
    const-string v8, "Successfully logged in"

    iput-object v8, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->message:Ljava/lang/String;

    .line 168
    .end local v0    # "amsg":Ljava/lang/String;
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "kv":Lcom/example/username/mifittrackexporter/util/FormValues;
    .end local v5    # "res":Lorg/json/JSONObject;
    .end local v7    # "responseCode":I
    :goto_b1
    return-object v6

    .line 162
    .restart local v0    # "amsg":Ljava/lang/String;
    .restart local v1    # "conn":Ljava/net/HttpURLConnection;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "kv":Lcom/example/username/mifittrackexporter/util/FormValues;
    .restart local v5    # "res":Lorg/json/JSONObject;
    .restart local v7    # "responseCode":I
    :cond_b2
    const/4 v8, 0x0

    iput-boolean v8, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->result:Z

    .line 163
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Can\'t log in: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->message:Ljava/lang/String;
    :try_end_ca
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_ca} :catch_cb

    goto :goto_b1

    .line 165
    .end local v0    # "amsg":Ljava/lang/String;
    .end local v1    # "conn":Ljava/net/HttpURLConnection;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "kv":Lcom/example/username/mifittrackexporter/util/FormValues;
    .end local v5    # "res":Lorg/json/JSONObject;
    .end local v7    # "responseCode":I
    :catch_cb
    move-exception v2

    .line 166
    .local v2, "e":Ljava/lang/Exception;
    const-string v8, "mifit"

    const-string v9, "Exception occurred while connecting: "

    invoke-static {v8, v9, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b1
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 122
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;->call()Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;

    move-result-object v0

    return-object v0
.end method
