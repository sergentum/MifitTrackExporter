.class public Lsergentum/export/SettingsActivity;
.super Landroid/preference/PreferenceActivity;
.source "SettingsActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lsergentum/export/SettingsActivity$AuthTask;
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

.field private starter:Lsergentum/export/Starter;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 35
    const-string v0, "endomondo_apikey"

    sput-object v0, Lsergentum/export/SettingsActivity;->ENDOMONDO_APIKEY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lsergentum/export/SettingsActivity;)Landroid/content/SharedPreferences;
    .registers 2
    .param p0, "x0"    # Lsergentum/export/SettingsActivity;

    .prologue
    .line 26
    iget-object v0, p0, Lsergentum/export/SettingsActivity;->sp:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$100(Lsergentum/export/SettingsActivity;)Lsergentum/export/Starter;
    .registers 2
    .param p0, "x0"    # Lsergentum/export/SettingsActivity;

    .prologue
    .line 26
    iget-object v0, p0, Lsergentum/export/SettingsActivity;->starter:Lsergentum/export/Starter;

    return-object v0
.end method

.method static synthetic access$200(Ljava/io/BufferedReader;)Lorg/json/JSONObject;
    .registers 2
    .param p0, "x0"    # Ljava/io/BufferedReader;

    .prologue
    .line 26
    invoke-static {p0}, Lsergentum/export/SettingsActivity;->parseKVP(Ljava/io/BufferedReader;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method private addAuthToggleListener()V
    .registers 3

    .prologue
    .line 51
    const-string v1, "endomondo_check"

    invoke-virtual {p0, v1}, Lsergentum/export/SettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 52
    .local v0, "endomondo_check":Landroid/preference/Preference;
    if-eqz v0, :cond_10

    .line 53
    new-instance v1, Lsergentum/export/SettingsActivity$1;

    invoke-direct {v1, p0}, Lsergentum/export/SettingsActivity$1;-><init>(Lsergentum/export/SettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 97
    :cond_10
    return-void
.end method

.method private static parseKVP(Ljava/io/BufferedReader;)Lorg/json/JSONObject;
    .registers 9
    .param p0, "in"    # Ljava/io/BufferedReader;

    .prologue
    .line 100
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 102
    .local v3, "obj":Lorg/json/JSONObject;
    const/4 v2, 0x0

    .line 104
    .local v2, "lineno":I
    :goto_6
    :try_start_6
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "s":Ljava/lang/String;
    if-eqz v4, :cond_66

    .line 105
    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 106
    .local v0, "c":I
    const/4 v5, -0x1

    if-ne v0, v5, :cond_32

    .line 107
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

    .line 111
    :goto_2f
    add-int/lit8 v2, v2, 0x1

    .line 112
    goto :goto_6

    .line 109
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

    .line 113
    .end local v0    # "c":I
    .end local v4    # "s":Ljava/lang/String;
    :catch_41
    move-exception v1

    .line 114
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

    .line 116
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_66
    return-object v3
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 39
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 40
    invoke-virtual {p0}, Lsergentum/export/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "preferences"

    const-string v3, "layout"

    invoke-virtual {p0}, Lsergentum/export/SettingsActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 41
    .local v0, "identifier":I
    const-string v1, "mifit"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "preferences: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    invoke-virtual {p0, v0}, Lsergentum/export/SettingsActivity;->addPreferencesFromResource(I)V

    .line 44
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lsergentum/export/SettingsActivity;->sp:Landroid/content/SharedPreferences;

    .line 45
    new-instance v1, Lsergentum/export/MifitStarter;

    invoke-direct {v1, p0}, Lsergentum/export/MifitStarter;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lsergentum/export/SettingsActivity;->starter:Lsergentum/export/Starter;

    .line 47
    invoke-direct {p0}, Lsergentum/export/SettingsActivity;->addAuthToggleListener()V

    .line 48
    return-void
.end method
