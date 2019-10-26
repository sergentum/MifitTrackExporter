.class public Lsergentum/sync/Response;
.super Ljava/lang/Object;
.source "Response.java"


# instance fields
.field public apikey:Ljava/lang/String;

.field public message:Ljava/lang/String;

.field public result:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    const/4 v0, 0x0

    iput-boolean v0, p0, Lsergentum/sync/Response;->result:Z

    return-void
.end method
