.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;
.super Ljava/lang/Object;
.source "MifitStarter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ChooseTrackClickListener"
.end annotation


# instance fields
.field private starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

.field final synthetic this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

.field private trackIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;Ljava/util/ArrayList;)V
    .registers 4
    .param p1, "this$0"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;
    .param p2, "starter"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 133
    .local p3, "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    .line 135
    iput-object p3, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->trackIds:Ljava/util/ArrayList;

    .line 136
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 9
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 139
    iget-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->trackIds:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 140
    .local v1, "trackId":Ljava/lang/Long;
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-nez v2, :cond_29

    .line 141
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    invoke-static {v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;)Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/SettingsActivity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 142
    .local v0, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    invoke-static {v2}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 146
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_28
    return-void

    .line 144
    :cond_29
    iget-object v2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->readRawDataWithId(J)V

    goto :goto_28
.end method
