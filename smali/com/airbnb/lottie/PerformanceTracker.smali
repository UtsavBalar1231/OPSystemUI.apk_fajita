.class public Lcom/airbnb/lottie/PerformanceTracker;
.super Ljava/lang/Object;
.source "PerformanceTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/airbnb/lottie/PerformanceTracker$FrameListener;
    }
.end annotation


# instance fields
.field private enabled:Z

.field private final floatComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/support/v4/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation
.end field

.field private final frameListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/airbnb/lottie/PerformanceTracker$FrameListener;",
            ">;"
        }
    .end annotation
.end field

.field private final layerRenderTimes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/airbnb/lottie/utils/MeanCalculator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->enabled:Z

    .line 24
    new-instance v0, Landroid/support/v4/util/ArraySet;

    invoke-direct {v0}, Landroid/support/v4/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->frameListeners:Ljava/util/Set;

    .line 25
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->layerRenderTimes:Ljava/util/Map;

    .line 26
    new-instance v0, Lcom/airbnb/lottie/PerformanceTracker$1;

    invoke-direct {v0, p0}, Lcom/airbnb/lottie/PerformanceTracker$1;-><init>(Lcom/airbnb/lottie/PerformanceTracker;)V

    iput-object v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->floatComparator:Ljava/util/Comparator;

    return-void
.end method


# virtual methods
.method public addFrameListener(Lcom/airbnb/lottie/PerformanceTracker$FrameListener;)V
    .locals 1
    .param p1, "frameListener"    # Lcom/airbnb/lottie/PerformanceTracker$FrameListener;

    .line 63
    iget-object v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->frameListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 64
    return-void
.end method

.method public clearRenderTimes()V
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->layerRenderTimes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 72
    return-void
.end method

.method public getSortedRenderTimes()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation

    .line 87
    iget-boolean v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->enabled:Z

    if-nez v0, :cond_0

    .line 88
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 90
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/airbnb/lottie/PerformanceTracker;->layerRenderTimes:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 91
    .local v0, "sortedRenderTimes":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/util/Pair<Ljava/lang/String;Ljava/lang/Float;>;>;"
    iget-object v1, p0, Lcom/airbnb/lottie/PerformanceTracker;->layerRenderTimes:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 92
    .local v2, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/airbnb/lottie/utils/MeanCalculator;>;"
    new-instance v3, Landroid/support/v4/util/Pair;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/airbnb/lottie/utils/MeanCalculator;

    invoke-virtual {v5}, Lcom/airbnb/lottie/utils/MeanCalculator;->getMean()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    .end local v2    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/airbnb/lottie/utils/MeanCalculator;>;"
    goto :goto_0

    .line 94
    :cond_1
    iget-object v1, p0, Lcom/airbnb/lottie/PerformanceTracker;->floatComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 95
    return-object v0
.end method

.method public logRenderTimes()V
    .locals 9

    .line 75
    iget-boolean v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->enabled:Z

    if-nez v0, :cond_0

    .line 76
    return-void

    .line 78
    :cond_0
    invoke-virtual {p0}, Lcom/airbnb/lottie/PerformanceTracker;->getSortedRenderTimes()Ljava/util/List;

    move-result-object v0

    .line 79
    .local v0, "sortedRenderTimes":Ljava/util/List;, "Ljava/util/List<Landroid/support/v4/util/Pair<Ljava/lang/String;Ljava/lang/Float;>;>;"
    const-string v1, "LOTTIE"

    const-string v2, "Render times:"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    const/4 v1, 0x0

    move v2, v1

    .local v2, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 81
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/util/Pair;

    .line 82
    .local v3, "layer":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/String;Ljava/lang/Float;>;"
    const-string v4, "LOTTIE"

    const-string v5, "\t\t%30s:%.2f"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, v3, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    aput-object v7, v6, v1

    iget-object v7, v3, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    const/4 v8, 0x1

    aput-object v7, v6, v8

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .end local v3    # "layer":Landroid/support/v4/util/Pair;, "Landroid/support/v4/util/Pair<Ljava/lang/String;Ljava/lang/Float;>;"
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 84
    .end local v2    # "i":I
    :cond_1
    return-void
.end method

.method public recordRenderTime(Ljava/lang/String;F)V
    .locals 3
    .param p1, "layerName"    # Ljava/lang/String;
    .param p2, "millis"    # F

    .line 45
    iget-boolean v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->enabled:Z

    if-nez v0, :cond_0

    .line 46
    return-void

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->layerRenderTimes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/airbnb/lottie/utils/MeanCalculator;

    .line 49
    .local v0, "meanCalculator":Lcom/airbnb/lottie/utils/MeanCalculator;
    if-nez v0, :cond_1

    .line 50
    new-instance v1, Lcom/airbnb/lottie/utils/MeanCalculator;

    invoke-direct {v1}, Lcom/airbnb/lottie/utils/MeanCalculator;-><init>()V

    move-object v0, v1

    .line 51
    iget-object v1, p0, Lcom/airbnb/lottie/PerformanceTracker;->layerRenderTimes:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    :cond_1
    invoke-virtual {v0, p2}, Lcom/airbnb/lottie/utils/MeanCalculator;->add(F)V

    .line 55
    const-string v1, "__container"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 56
    iget-object v1, p0, Lcom/airbnb/lottie/PerformanceTracker;->frameListeners:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/airbnb/lottie/PerformanceTracker$FrameListener;

    .line 57
    .local v2, "listener":Lcom/airbnb/lottie/PerformanceTracker$FrameListener;
    invoke-interface {v2, p2}, Lcom/airbnb/lottie/PerformanceTracker$FrameListener;->onFrameRendered(F)V

    .line 58
    .end local v2    # "listener":Lcom/airbnb/lottie/PerformanceTracker$FrameListener;
    goto :goto_0

    .line 60
    :cond_2
    return-void
.end method

.method public removeFrameListener(Lcom/airbnb/lottie/PerformanceTracker$FrameListener;)V
    .locals 1
    .param p1, "frameListener"    # Lcom/airbnb/lottie/PerformanceTracker$FrameListener;

    .line 67
    iget-object v0, p0, Lcom/airbnb/lottie/PerformanceTracker;->frameListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 68
    return-void
.end method

.method setEnabled(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .line 41
    iput-boolean p1, p0, Lcom/airbnb/lottie/PerformanceTracker;->enabled:Z

    .line 42
    return-void
.end method
