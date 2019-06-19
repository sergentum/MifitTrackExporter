.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SportDetailsActivity;
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
.method public onShareClicked(Landroid/view/View;)V
    .registers 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 11
    new-instance v0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    invoke-direct {v0, p0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;-><init>(Landroid/app/Activity;)V

    .line 12
    .local v0, "starter":Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
    invoke-virtual {v0}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->showTracks()V

    .line 13
    return-void
.end method
