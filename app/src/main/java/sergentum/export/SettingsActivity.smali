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
    .line 37
    const-string v0, "endomondo_apikey"

    sput-object v0, Lsergentum/export/SettingsActivity;->ENDOMONDO_APIKEY:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Landroid/preference/PreferenceActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lsergentum/export/SettingsActivity;)Landroid/content/SharedPreferences;
    .registers 2
    .param p0, "x0"    # Lsergentum/export/SettingsActivity;

    .prologue
    .line 28
    iget-object v0, p0, Lsergentum/export/SettingsActivity;->sp:Landroid/content/SharedPreferences;

    return-object v0
.end method

.method static synthetic access$100(Lsergentum/export/SettingsActivity;)Lsergentum/export/Starter;
    .registers 2
    .param p0, "x0"    # Lsergentum/export/SettingsActivity;

    .prologue
    .line 28
    iget-object v0, p0, Lsergentum/export/SettingsActivity;->starter:Lsergentum/export/Starter;

    return-object v0
.end method

.method private addAuthToggleListener()V
    .registers 3

    .prologue
    .line 53
    const-string v1, "endomondo_check"

    invoke-virtual {p0, v1}, Lsergentum/export/SettingsActivity;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 54
    .local v0, "endomondo_check":Landroid/preference/Preference;
    if-eqz v0, :cond_10

    .line 55
    new-instance v1, Lsergentum/export/SettingsActivity$1;

    invoke-direct {v1, p0}, Lsergentum/export/SettingsActivity$1;-><init>(Lsergentum/export/SettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 100
    :cond_10
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 41
    invoke-super {p0, p1}, Landroid/preference/PreferenceActivity;->onCreate(Landroid/os/Bundle;)V

    .line 42
    invoke-virtual {p0}, Lsergentum/export/SettingsActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "preferences"

    const-string v3, "layout"

    invoke-virtual {p0}, Lsergentum/export/SettingsActivity;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 43
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

    .line 44
    invoke-virtual {p0, v0}, Lsergentum/export/SettingsActivity;->addPreferencesFromResource(I)V

    .line 46
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lsergentum/export/SettingsActivity;->sp:Landroid/content/SharedPreferences;

    .line 47
    new-instance v1, Lsergentum/export/MifitStarter;

    invoke-direct {v1, p0}, Lsergentum/export/MifitStarter;-><init>(Landroid/app/Activity;)V

    iput-object v1, p0, Lsergentum/export/SettingsActivity;->starter:Lsergentum/export/Starter;

    .line 49
    invoke-direct {p0}, Lsergentum/export/SettingsActivity;->addAuthToggleListener()V

    .line 50
    return-void
.end method
