.class public interface abstract Lcom/android/server/am/PreventRunningHook;
.super Ljava/lang/Object;
.source "PreventRunningHook.java"


# virtual methods
.method public abstract hookBindService(Landroid/content/Intent;)Z
.end method

.method public abstract hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z
.end method

.method public abstract hookStartService(Landroid/content/Intent;)Z
.end method

.method public abstract isExcludingStopped(Ljava/lang/String;)Z
.end method

.method public abstract match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Object;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation
.end method

.method public abstract onAppDied(Ljava/lang/Object;)V
.end method

.method public abstract onBroadcastIntent(Landroid/content/Intent;)V
.end method

.method public abstract onCleanUpRemovedTask(Ljava/lang/String;)V
.end method

.method public abstract onDestroyActivity(Ljava/lang/Object;)V
.end method

.method public abstract onLaunchActivity(Ljava/lang/Object;)V
.end method

.method public abstract onMoveActivityTaskToBack(Ljava/lang/String;)V
.end method

.method public abstract onResumeActivity(Ljava/lang/Object;)V
.end method

.method public abstract onStartHomeActivity(Ljava/lang/String;)V
.end method

.method public abstract onUserLeavingActivity(Ljava/lang/Object;)V
.end method

.method public abstract setMethod(Ljava/lang/String;)V
.end method

.method public abstract setSender(Ljava/lang/String;)V
.end method

.method public abstract setVersion(I)V
.end method
