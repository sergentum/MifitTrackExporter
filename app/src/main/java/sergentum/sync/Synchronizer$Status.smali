.class public final enum Lsergentum/sync/Synchronizer$Status;
.super Ljava/lang/Enum;
.source "Synchronizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsergentum/sync/Synchronizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lsergentum/sync/Synchronizer$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lsergentum/sync/Synchronizer$Status;

.field public static final enum ERROR:Lsergentum/sync/Synchronizer$Status;

.field public static final enum FAIL:Lsergentum/sync/Synchronizer$Status;

.field public static final enum NEED_AUTH:Lsergentum/sync/Synchronizer$Status;

.field public static final enum OK:Lsergentum/sync/Synchronizer$Status;

.field public static final enum SKIP:Lsergentum/sync/Synchronizer$Status;


# instance fields
.field public ex:Ljava/lang/Exception;

.field public message:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 5
    new-instance v0, Lsergentum/sync/Synchronizer$Status;

    const-string v1, "OK"

    invoke-direct {v0, v1, v2}, Lsergentum/sync/Synchronizer$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$Status;->OK:Lsergentum/sync/Synchronizer$Status;

    new-instance v0, Lsergentum/sync/Synchronizer$Status;

    const-string v1, "ERROR"

    invoke-direct {v0, v1, v3}, Lsergentum/sync/Synchronizer$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$Status;->ERROR:Lsergentum/sync/Synchronizer$Status;

    new-instance v0, Lsergentum/sync/Synchronizer$Status;

    const-string v1, "FAIL"

    invoke-direct {v0, v1, v4}, Lsergentum/sync/Synchronizer$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$Status;->FAIL:Lsergentum/sync/Synchronizer$Status;

    new-instance v0, Lsergentum/sync/Synchronizer$Status;

    const-string v1, "SKIP"

    invoke-direct {v0, v1, v5}, Lsergentum/sync/Synchronizer$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$Status;->SKIP:Lsergentum/sync/Synchronizer$Status;

    new-instance v0, Lsergentum/sync/Synchronizer$Status;

    const-string v1, "NEED_AUTH"

    invoke-direct {v0, v1, v6}, Lsergentum/sync/Synchronizer$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$Status;->NEED_AUTH:Lsergentum/sync/Synchronizer$Status;

    .line 4
    const/4 v0, 0x5

    new-array v0, v0, [Lsergentum/sync/Synchronizer$Status;

    sget-object v1, Lsergentum/sync/Synchronizer$Status;->OK:Lsergentum/sync/Synchronizer$Status;

    aput-object v1, v0, v2

    sget-object v1, Lsergentum/sync/Synchronizer$Status;->ERROR:Lsergentum/sync/Synchronizer$Status;

    aput-object v1, v0, v3

    sget-object v1, Lsergentum/sync/Synchronizer$Status;->FAIL:Lsergentum/sync/Synchronizer$Status;

    aput-object v1, v0, v4

    sget-object v1, Lsergentum/sync/Synchronizer$Status;->SKIP:Lsergentum/sync/Synchronizer$Status;

    aput-object v1, v0, v5

    sget-object v1, Lsergentum/sync/Synchronizer$Status;->NEED_AUTH:Lsergentum/sync/Synchronizer$Status;

    aput-object v1, v0, v6

    sput-object v0, Lsergentum/sync/Synchronizer$Status;->$VALUES:[Lsergentum/sync/Synchronizer$Status;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 6
    iput-object v0, p0, Lsergentum/sync/Synchronizer$Status;->ex:Ljava/lang/Exception;

    .line 7
    iput-object v0, p0, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsergentum/sync/Synchronizer$Status;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 4
    const-class v0, Lsergentum/sync/Synchronizer$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lsergentum/sync/Synchronizer$Status;

    return-object v0
.end method

.method public static values()[Lsergentum/sync/Synchronizer$Status;
    .registers 1

    .prologue
    .line 4
    sget-object v0, Lsergentum/sync/Synchronizer$Status;->$VALUES:[Lsergentum/sync/Synchronizer$Status;

    invoke-virtual {v0}, [Lsergentum/sync/Synchronizer$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsergentum/sync/Synchronizer$Status;

    return-object v0
.end method


# virtual methods
.method public toConsoleString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Status{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lsergentum/sync/Synchronizer$Status;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", message=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/sync/Synchronizer$Status;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lsergentum/sync/Synchronizer$Status;->ex:Ljava/lang/Exception;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
