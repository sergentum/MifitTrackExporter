.class Lsergentum/export/core/Model$Step;
.super Ljava/lang/Object;
.source "Model.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lsergentum/export/core/Model;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Step"
.end annotation


# instance fields
.field cadence:I

.field first:I

.field second:I

.field stride:I


# direct methods
.method constructor <init>(IIII)V
    .registers 5
    .param p1, "first"    # I
    .param p2, "second"    # I
    .param p3, "stride"    # I
    .param p4, "cadence"    # I

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput p1, p0, Lsergentum/export/core/Model$Step;->first:I

    .line 72
    iput p2, p0, Lsergentum/export/core/Model$Step;->second:I

    .line 73
    iput p3, p0, Lsergentum/export/core/Model$Step;->stride:I

    .line 74
    iput p4, p0, Lsergentum/export/core/Model$Step;->cadence:I

    .line 75
    return-void
.end method
