.class public final enum Lsergentum/export/core/Model$ActivityType;
.super Ljava/lang/Enum;
.source "Model.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsergentum/export/core/Model;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ActivityType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lsergentum/export/core/Model$ActivityType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lsergentum/export/core/Model$ActivityType;

.field public static final enum CYCLING:Lsergentum/export/core/Model$ActivityType;

.field public static final enum RUNNING:Lsergentum/export/core/Model$ActivityType;

.field public static final enum TREADMILL:Lsergentum/export/core/Model$ActivityType;

.field public static final enum WALKING:Lsergentum/export/core/Model$ActivityType;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lsergentum/export/core/Model$ActivityType;

    const-string v1, "RUNNING"

    invoke-direct {v0, v1, v2}, Lsergentum/export/core/Model$ActivityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    new-instance v0, Lsergentum/export/core/Model$ActivityType;

    const-string v1, "TREADMILL"

    invoke-direct {v0, v1, v3}, Lsergentum/export/core/Model$ActivityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/export/core/Model$ActivityType;->TREADMILL:Lsergentum/export/core/Model$ActivityType;

    new-instance v0, Lsergentum/export/core/Model$ActivityType;

    const-string v1, "WALKING"

    invoke-direct {v0, v1, v4}, Lsergentum/export/core/Model$ActivityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/export/core/Model$ActivityType;->WALKING:Lsergentum/export/core/Model$ActivityType;

    new-instance v0, Lsergentum/export/core/Model$ActivityType;

    const-string v1, "CYCLING"

    invoke-direct {v0, v1, v5}, Lsergentum/export/core/Model$ActivityType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lsergentum/export/core/Model$ActivityType;->CYCLING:Lsergentum/export/core/Model$ActivityType;

    .line 29
    const/4 v0, 0x4

    new-array v0, v0, [Lsergentum/export/core/Model$ActivityType;

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->RUNNING:Lsergentum/export/core/Model$ActivityType;

    aput-object v1, v0, v2

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->TREADMILL:Lsergentum/export/core/Model$ActivityType;

    aput-object v1, v0, v3

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->WALKING:Lsergentum/export/core/Model$ActivityType;

    aput-object v1, v0, v4

    sget-object v1, Lsergentum/export/core/Model$ActivityType;->CYCLING:Lsergentum/export/core/Model$ActivityType;

    aput-object v1, v0, v5

    sput-object v0, Lsergentum/export/core/Model$ActivityType;->$VALUES:[Lsergentum/export/core/Model$ActivityType;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lsergentum/export/core/Model$ActivityType;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lsergentum/export/core/Model$ActivityType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lsergentum/export/core/Model$ActivityType;

    return-object v0
.end method

.method public static values()[Lsergentum/export/core/Model$ActivityType;
    .registers 1

    .prologue
    .line 29
    sget-object v0, Lsergentum/export/core/Model$ActivityType;->$VALUES:[Lsergentum/export/core/Model$ActivityType;

    invoke-virtual {v0}, [Lsergentum/export/core/Model$ActivityType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lsergentum/export/core/Model$ActivityType;

    return-object v0
.end method
