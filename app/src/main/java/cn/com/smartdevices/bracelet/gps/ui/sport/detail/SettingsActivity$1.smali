.class Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;


# direct methods
.method constructor <init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)V
    .registers 2
    .param p1, "this$0"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    .prologue
    .line 56
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .registers 15
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    .line 60
    const/4 v1, 0x0

    .line 61
    .local v1, "allowToggle":Z
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    .line 62
    .local v7, "toggle":Z
    if-eqz v7, :cond_b3

    .line 64
    new-instance v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;

    invoke-direct {v6}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;-><init>()V

    .line 68
    .local v6, "response":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;
    :try_start_e
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 69
    .local v5, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v8, "endomondo_login"

    iget-object v9, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-static {v9}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, "endomondo_login"

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    const-string v8, "endomondo_password"

    iget-object v9, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-static {v9}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, "endomondo_password"

    const/4 v11, 0x0

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    const-string v8, "deviceId"

    iget-object v9, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-static {v9}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Landroid/content/SharedPreferences;

    move-result-object v9

    const-string v10, "deviceId"

    const-string v11, "deviceId"

    invoke-interface {v9, v10, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    new-instance v2, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;

    invoke-direct {v2, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;-><init>(Ljava/util/Map;)V

    .line 74
    .local v2, "authTask":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;
    new-instance v4, Ljava/util/concurrent/FutureTask;

    invoke-direct {v4, v2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 75
    .local v4, "future":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;>;"
    new-instance v8, Ljava/lang/Thread;

    invoke-direct {v8, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v8}, Ljava/lang/Thread;->start()V

    .line 77
    invoke-virtual {v4}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;

    move-object v6, v0
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_64} :catch_a7

    .line 83
    .end local v2    # "authTask":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$AuthTask;
    .end local v4    # "future":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;>;"
    .end local v5    # "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_64
    iget-boolean v8, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->result:Z

    if-eqz v8, :cond_93

    .line 84
    iget-object v8, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-static {v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Landroid/content/SharedPreferences;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    sget-object v9, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->ENDOMONDO_APIKEY:Ljava/lang/String;

    iget-object v10, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->apikey:Ljava/lang/String;

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 85
    iget-object v8, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-static {v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Landroid/content/SharedPreferences;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    const-string v9, "endomondo_password"

    const-string v10, ""

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 86
    const/4 v1, 0x1

    .line 88
    :cond_93
    const-string v8, "mifit"

    iget-object v9, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->message:Ljava/lang/String;

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    iget-object v8, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-static {v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->access$100(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    move-result-object v8

    iget-object v9, v6, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;->message:Ljava/lang/String;

    const/4 v10, 0x1

    invoke-virtual {v8, v9, v10}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->showToast(Ljava/lang/String;I)V

    .line 97
    .end local v6    # "response":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;
    :goto_a6
    return v1

    .line 78
    .restart local v6    # "response":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;
    :catch_a7
    move-exception v3

    .line 79
    .local v3, "e":Ljava/lang/Exception;
    const-string v8, "mifit"

    const-string v9, "Can\'t get authToken from AuthTask"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_64

    .line 92
    .end local v3    # "e":Ljava/lang/Exception;
    .end local v6    # "response":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/Response;
    :cond_b3
    const-string v8, "mifit"

    const-string v9, "synchronization disabled, apikey removed"

    invoke-static {v8, v9}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    iget-object v8, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity$1;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-static {v8}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;)Landroid/content/SharedPreferences;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    sget-object v9, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;->ENDOMONDO_APIKEY:Ljava/lang/String;

    const-string v10, ""

    invoke-interface {v8, v9, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v8

    invoke-interface {v8}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 94
    const/4 v1, 0x1

    goto :goto_a6
.end method
