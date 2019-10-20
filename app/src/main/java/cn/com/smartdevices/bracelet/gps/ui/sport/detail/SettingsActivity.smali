.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;
.super Landroid/preference/PreferenceActivity;
.source "SettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;
    }
.end annotation


# static fields
.field private static final AUTH_URL:Ljava/lang/String; = "https://api.mobile.endomondo.com/mobile/auth"

.field public static ENDOMONDO_APIKEY:Ljava/lang/String; = null

.field private static final FEED_URL:Ljava/lang/String; = "https://api.mobile.endomondo.com/mobile/api/feed"

.field private static final PUBLIC_URL:Ljava/lang/String; = "https://www.endomondo.com"

.field private static final UPLOAD_URL:Ljava/lang/String; = "https://api.mobile.endomondo.com/mobile/track"


# instance fields
.field private sp:Landroid/content/SharedPreferences;

.field private starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 36
    const-string v0, "endomondo_apikey"

    sput-object v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->ENDOMONDO_APIKEY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 27
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Landroid/content/SharedPreferences;
    .registers 2
    .param p0, "x0"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    .prologue
    .line 27
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->sp:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$100(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
    .registers 2
    .param p0, "x0"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    .prologue
    .line 27
    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    return-object v0
.end method

.method static synthetic access$200(Ljava/io/BufferedReader;)Lorg/json/JSONObject;
    .registers 2
    .param p0, "x0"    # Ljava/io/BufferedReader;

    .prologue
    .line 27
    invoke-static {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->parseKVP(Ljava/io/BufferedReader;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method private static parseKVP(Ljava/io/BufferedReader;)Lorg/json/JSONObject;
    .registers 9
    .param p0, "in"    # Ljava/io/BufferedReader;

    .prologue
    .line 103
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 105
    .local v3, "obj":Lorg/json/JSONObject;
    const/4 v2, 0x0

    .line 107
    .local v2, "lineno":I
    :goto_6
    :try_start_6
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "s":Ljava/lang/String;
    if-eqz v4, :cond_66

    .line 108
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 109
    .local v0, "c":I
    const/4 v5, -0x1

    if-ne v0, v5, :cond_32

    .line 110
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    :goto_2f
    add-int/lit8 v2, v2, 0x1

    .line 115
    goto :goto_6

    .line 112
    :cond_32
    const/4 v5, 0x0

    invoke-virtual {v4, v5, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v6, v0, 0x1

    invoke-virtual {v4, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_40} :catch_41

    goto :goto_2f

    .line 116
    .end local v0    # "c":I
    .end local v4    # "s":Ljava/lang/String;
    :catch_41
    move-exception v1

    .line 117
    .local v1, "ex":Ljava/lang/Exception;
    const-string v5, "mifit"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_66
    return-object v3
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 40
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 44
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "activity_main"

    const-string v4, "id"

    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 45
    .local v1, "identifier":I
    const-string v2, "mifit"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "activity_main"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string v3, "preferences"

    const-string v4, "layout"

    invoke-virtual {p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 49
    const-string v2, "mifit"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "preferences: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    invoke-virtual {p0, v1}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->addPreferencesFromResource(I)V

    .line 52
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    iput-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->sp:Landroid/content/SharedPreferences;

    .line 53
    new-instance v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    invoke-direct {v2, p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;-><init>(Landroid/app/Activity;)V

    iput-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    .line 55
    const-string v2, "endomondo_check"

    invoke-virtual {p0, v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 56
    .local v0, "endomondo_check":Landroid/preference/Preference;
    new-instance v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;

    invoke-direct {v2, p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;-><init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)V

    invoke-virtual {v0, v2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 100
    return-void
.end method
