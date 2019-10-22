.class public Lcom/huami/moving/ui/sport/detail/SportDetailsActivity;
.super Landroid/app/Activity;
.source "SportDetailsActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public initExport()V
    .registers 2

    .prologue
    .line 16
    new-instance v0, Lsergentum/export/MifitStarter;

    invoke-direct {v0, p0}, Lsergentum/export/MifitStarter;-><init>(Landroid/app/Activity;)V

    .line 17
    .local v0, "starter":Lsergentum/export/MifitStarter;
    invoke-virtual {v0}, Lsergentum/export/MifitStarter;->showTracks()V

    .line 18
    return-void
.end method

.method public onShareClicked(Landroid/view/View;)V
    .registers 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 12
    invoke-virtual {p0}, Lcom/huami/moving/ui/sport/detail/SportDetailsActivity;->initExport()V

    .line 13
    return-void
.end method
