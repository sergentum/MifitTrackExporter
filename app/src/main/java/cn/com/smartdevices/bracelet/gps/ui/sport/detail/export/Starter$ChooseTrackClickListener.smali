.class public Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;
.super Ljava/lang/Object;
.source "Starter.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ChooseTrackClickListener"
.end annotation


# instance fields
.field private starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

.field final synthetic this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

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
.method constructor <init>(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;Ljava/util/ArrayList;)V
    .registers 4
    .param p1, "this$0"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
    .param p2, "starter"    # Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 144
    .local p3, "trackIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Long;>;"
    iput-object p1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;->this$0:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    iput-object p2, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    .line 146
    iput-object p3, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;->trackIds:Ljava/util/ArrayList;

    .line 147
    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 7
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 150
    iget-object v1, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;->starter:Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;

    iget-object v0, p0, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter$ChooseTrackClickListener;->trackIds:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;->access$000(Lcn/com/smartdevices/bracelet/gps/ui/sport/detail/export/Starter;J)V

    .line 151
    return-void
.end method
