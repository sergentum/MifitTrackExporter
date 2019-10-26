.class public Lsergentum/util/Part;
.super Ljava/lang/Object;
.source "Part.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Value::",
        "Lsergentum/util/Writable;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private contentTransferEncoding:Ljava/lang/String;

.field private contentType:Ljava/lang/String;

.field private filename:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private value:Lsergentum/util/Writable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TValue;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lsergentum/util/Writable;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TValue;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    .local p2, "value":Lsergentum/util/Writable;, "TValue;"
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object v0, p0, Lsergentum/util/Part;->name:Ljava/lang/String;

    .line 24
    iput-object v0, p0, Lsergentum/util/Part;->filename:Ljava/lang/String;

    .line 25
    iput-object v0, p0, Lsergentum/util/Part;->contentType:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lsergentum/util/Part;->contentTransferEncoding:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lsergentum/util/Part;->value:Lsergentum/util/Writable;

    .line 30
    iput-object p1, p0, Lsergentum/util/Part;->name:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lsergentum/util/Part;->value:Lsergentum/util/Writable;

    .line 32
    return-void
.end method


# virtual methods
.method public getContentTransferEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    iget-object v0, p0, Lsergentum/util/Part;->contentTransferEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 50
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    iget-object v0, p0, Lsergentum/util/Part;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .registers 2

    .prologue
    .line 42
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    iget-object v0, p0, Lsergentum/util/Part;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 35
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    iget-object v0, p0, Lsergentum/util/Part;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Lsergentum/util/Writable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TValue;"
        }
    .end annotation

    .prologue
    .line 62
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    iget-object v0, p0, Lsergentum/util/Part;->value:Lsergentum/util/Writable;

    return-object v0
.end method

.method public setContentTransferEncoding(Ljava/lang/String;)V
    .registers 2
    .param p1, "contentTransferEncoding"    # Ljava/lang/String;

    .prologue
    .line 54
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    iput-object p1, p0, Lsergentum/util/Part;->contentTransferEncoding:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .registers 2
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 46
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    iput-object p1, p0, Lsergentum/util/Part;->contentType:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setFilename(Ljava/lang/String;)V
    .registers 2
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 38
    .local p0, "this":Lsergentum/util/Part;, "Lsergentum/util/Part<TValue;>;"
    iput-object p1, p0, Lsergentum/util/Part;->filename:Ljava/lang/String;

    .line 39
    return-void
.end method
