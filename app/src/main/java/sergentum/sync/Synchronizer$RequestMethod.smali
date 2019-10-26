.class public final enum Lsergentum/sync/Synchronizer$RequestMethod;
.super Ljava/lang/Enum;
.source "Synchronizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsergentum/sync/Synchronizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RequestMethod"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lsergentum/sync/Synchronizer$RequestMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lsergentum/sync/Synchronizer$RequestMethod;

.field public static final enum GET:Lsergentum/sync/Synchronizer$RequestMethod;

.field public static final enum PATCH:Lsergentum/sync/Synchronizer$RequestMethod;

.field public static final enum POST:Lsergentum/sync/Synchronizer$RequestMethod;

.field public static final enum PUT:Lsergentum/sync/Synchronizer$RequestMethod;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 4
    new-instance v0, Lsergentum/sync/Synchronizer$RequestMethod;

    const-string v1, "GET"

    invoke-direct {v0, v1, v2}, Lsergentum/sync/Synchronizer$RequestMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$RequestMethod;->GET:Lsergentum/sync/Synchronizer$RequestMethod;

    new-instance v0, Lsergentum/sync/Synchronizer$RequestMethod;

    const-string v1, "POST"

    invoke-direct {v0, v1, v3}, Lsergentum/sync/Synchronizer$RequestMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$RequestMethod;->POST:Lsergentum/sync/Synchronizer$RequestMethod;

    new-instance v0, Lsergentum/sync/Synchronizer$RequestMethod;

    const-string v1, "PATCH"

    invoke-direct {v0, v1, v4}, Lsergentum/sync/Synchronizer$RequestMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$RequestMethod;->PATCH:Lsergentum/sync/Synchronizer$RequestMethod;

    new-instance v0, Lsergentum/sync/Synchronizer$RequestMethod;

    const-string v1, "PUT"

    invoke-direct {v0, v1, v5}, Lsergentum/sync/Synchronizer$RequestMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/sync/Synchronizer$RequestMethod;->PUT:Lsergentum/sync/Synchronizer$RequestMethod;

    const/4 v0, 0x4

    new-array v0, v0, [Lsergentum/sync/Synchronizer$RequestMethod;

    sget-object v1, Lsergentum/sync/Synchronizer$RequestMethod;->GET:Lsergentum/sync/Synchronizer$RequestMethod;

    aput-object v1, v0, v2

    sget-object v1, Lsergentum/sync/Synchronizer$RequestMethod;->POST:Lsergentum/sync/Synchronizer$RequestMethod;

    aput-object v1, v0, v3

    sget-object v1, Lsergentum/sync/Synchronizer$RequestMethod;->PATCH:Lsergentum/sync/Synchronizer$RequestMethod;

    aput-object v1, v0, v4

    sget-object v1, Lsergentum/sync/Synchronizer$RequestMethod;->PUT:Lsergentum/sync/Synchronizer$RequestMethod;

    aput-object v1, v0, v5

    sput-object v0, Lsergentum/sync/Synchronizer$RequestMethod;->$VALUES:[Lsergentum/sync/Synchronizer$RequestMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsergentum/sync/Synchronizer$RequestMethod;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 4
    const-class v0, Lsergentum/sync/Synchronizer$RequestMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lsergentum/sync/Synchronizer$RequestMethod;

    return-object v0
.end method

.method public static values()[Lsergentum/sync/Synchronizer$RequestMethod;
    .registers 1

    .prologue
    .line 4
    sget-object v0, Lsergentum/sync/Synchronizer$RequestMethod;->$VALUES:[Lsergentum/sync/Synchronizer$RequestMethod;

    invoke-virtual {v0}, [Lsergentum/sync/Synchronizer$RequestMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsergentum/sync/Synchronizer$RequestMethod;

    return-object v0
.end method
