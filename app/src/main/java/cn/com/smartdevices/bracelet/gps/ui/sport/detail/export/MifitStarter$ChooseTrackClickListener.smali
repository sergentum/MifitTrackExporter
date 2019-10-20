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
    .line 136
    .local p3, "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 137
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    .line 138
    iput-object p3, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->trackIds:Ljava/util/ArrayList;

    .line 139
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 9
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 142
    iget-object v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->trackIds:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    .line 143
    .local v0, "trackId":Ljava/lang/Long;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-nez v1, :cond_1b

    .line 146
    iget-object v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    const-string v2, "Sorry, settings screen doesn\'t implemented yet"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->showToast(Ljava/lang/String;I)V

    .line 150
    :goto_1a
    return-void

    .line 148
    :cond_1b
    iget-object v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter$ChooseTrackClickListener;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/MifitStarter;->readRawDataWithId(J)V

    goto :goto_1a
.end method
