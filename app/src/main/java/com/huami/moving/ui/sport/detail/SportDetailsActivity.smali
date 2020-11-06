.class public Lcom/huami/moving/ui/sport/detail/SportDetailsActivity;
.super Landroid/app/Activity;
.source "SportDetailsActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public initExport()V
    .registers 3

    .prologue
    .line 19
    new-instance v0, Lsergentum/export/MifitStarter;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lsergentum/export/MifitStarter;-><init>(Landroid/app/Activity;Z)V

    .line 20
    .local v0, "starter":Lsergentum/export/MifitStarter;
    invoke-virtual {v0}, Lsergentum/export/MifitStarter;->showTracks()V

    .line 21
    return-void
.end method

.method protected onResume()V
    .registers 4

    .prologue
    .line 26
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 27
    const-string v1, "mifit1"

    const-string v2, "com/xiaomi/hm/health/activity/StartUpActivity onResume"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    new-instance v0, Lsergentum/export/MifitStarter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lsergentum/export/MifitStarter;-><init>(Landroid/app/Activity;Z)V

    .line 29
    .local v0, "starter":Lsergentum/export/MifitStarter;
    invoke-virtual {v0}, Lsergentum/export/MifitStarter;->invokeSync()V

    .line 30
    return-void
.end method

.method public onShareClicked(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 15
    invoke-virtual {p0}, Lcom/huami/moving/ui/sport/detail/SportDetailsActivity;->initExport()V

    .line 16
    return-void
.end method
