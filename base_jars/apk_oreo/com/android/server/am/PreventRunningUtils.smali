.class public Lcom/android/server/am/PreventRunningUtils;
.super Ljava/lang/Object;
.source "PreventRunningUtils.java"


# static fields
.field private static ams:Lcom/android/server/am/ActivityManagerService;

.field private static mPreventRunning:Lcom/android/server/am/PreventRunning;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/android/server/am/PreventRunning;

    invoke-direct {v0}, Lcom/android/server/am/PreventRunning;-><init>()V

    sput-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearSender()V
    .registers 2

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->setSender(Ljava/lang/String;)V

    return-void
.end method

.method private static forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    invoke-static {p0}, Lcom/android/server/am/ActivityRecord;->forTokenLocked(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    invoke-static {p0}, Lcom/android/server/am/ActivityRecord;->forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v0

    goto :goto_a
.end method

.method private static getAms()Lcom/android/server/am/ActivityManagerService;
    .registers 1

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->ams:Lcom/android/server/am/ActivityManagerService;

    if-nez v0, :cond_e

    const-string v0, "activity"

    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    check-cast v0, Lcom/android/server/am/ActivityManagerService;

    sput-object v0, Lcom/android/server/am/PreventRunningUtils;->ams:Lcom/android/server/am/ActivityManagerService;

    :cond_e
    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->ams:Lcom/android/server/am/ActivityManagerService;

    return-object v0
.end method

.method public static hookBindService(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;)Z
    .registers 4

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p2}, Lcom/android/server/am/PreventRunning;->hookBindService(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public static hookStartProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;)Z
    .registers 8

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->getAms()Lcom/android/server/am/ActivityManagerService;

    move-result-object v1

    iget-object v1, v1, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1, p1, p4, p5}, Lcom/android/server/am/PreventRunning;->hookStartProcessLocked(Landroid/content/Context;Landroid/content/pm/ApplicationInfo;Ljava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    return v0
.end method

.method public static hookStartService(Landroid/app/IApplicationThread;Landroid/content/Intent;)Z
    .registers 3

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p1}, Lcom/android/server/am/PreventRunning;->hookStartService(Landroid/content/Intent;)Z

    move-result v0

    return v0
.end method

.method public static isExcludingStopped(Landroid/content/Intent;)Z
    .registers 4

    invoke-virtual {p0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Intent;->getFlags()I

    move-result v1

    and-int/lit8 v1, v1, 0x30

    const/16 v2, 0x10

    if-ne v1, v2, :cond_1a

    if-eqz v0, :cond_1a

    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v1, v0}, Lcom/android/server/am/PreventRunning;->isExcludingStopped(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    :goto_19
    return v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public static match(Landroid/content/IntentFilter;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;Ljava/lang/String;)I
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/IntentFilter;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/net/Uri;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")I"
        }
    .end annotation

    invoke-virtual/range {p0 .. p6}, Landroid/content/IntentFilter;->match(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;Ljava/lang/String;)I

    move-result v1

    if-ltz v1, :cond_12

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/android/server/am/PreventRunning;->match(ILjava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/util/Set;)I

    move-result v1

    :cond_12
    return v1
.end method

.method public static onAppDied(Lcom/android/server/am/ProcessRecord;)V
    .registers 2

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p0}, Lcom/android/server/am/PreventRunning;->onAppDied(Ljava/lang/Object;)V

    return-void
.end method

.method public static onBroadcastIntent(Landroid/content/Intent;)V
    .registers 2

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0, p0}, Lcom/android/server/am/PreventRunning;->onBroadcastIntent(Landroid/content/Intent;)V

    return-void
.end method

.method public static onCleanUpRemovedTask(Landroid/content/Intent;)V
    .registers 3

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-eqz v0, :cond_15

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onCleanUpRemovedTask(Ljava/lang/String;)V

    :cond_15
    return-void
.end method

.method public static onDestroyActivity(Landroid/os/IBinder;)V
    .registers 3

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onDestroyActivity(Ljava/lang/Object;)V

    return-void
.end method

.method public static onLaunchActivity(Landroid/os/IBinder;)V
    .registers 3

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onLaunchActivity(Ljava/lang/Object;)V

    return-void
.end method

.method public static onMoveActivityTaskToBack(Landroid/os/IBinder;)V
    .registers 3

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v0

    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    if-eqz v0, :cond_e

    iget-object v0, v0, Lcom/android/server/am/ActivityRecord;->packageName:Ljava/lang/String;

    :goto_a
    invoke-virtual {v1, v0}, Lcom/android/server/am/PreventRunning;->onMoveActivityTaskToBack(Ljava/lang/String;)V

    return-void

    :cond_e
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public static onResumeActivity(Landroid/os/IBinder;)V
    .registers 3

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onResumeActivity(Ljava/lang/Object;)V

    return-void
.end method

.method public static onStartActivity(ILandroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;)I
    .registers 6

    if-ltz p0, :cond_27

    if-eqz p3, :cond_27

    const-string v0, "android.intent.category.HOME"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_14

    const-string v0, "android.intent.category.LAUNCHER"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->hasCategory(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_27

    :cond_14
    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->getAms()Lcom/android/server/am/ActivityManagerService;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/server/am/ActivityManagerService;->getRecordForAppLocked(Landroid/app/IApplicationThread;)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    if-eqz v0, :cond_27

    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    iget-object v0, v0, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/android/server/am/PreventRunning;->onStartHomeActivity(Ljava/lang/String;)V

    :cond_27
    return p0
.end method

.method public static onUserLeavingActivity(Landroid/os/IBinder;ZZ)V
    .registers 5

    if-eqz p2, :cond_b

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-static {p0}, Lcom/android/server/am/PreventRunningUtils;->forToken(Landroid/os/IBinder;)Lcom/android/server/am/ActivityRecord;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/server/am/PreventRunning;->onUserLeavingActivity(Ljava/lang/Object;)V

    :cond_b
    return-void
.end method

.method public static returnFalse()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method public static returnFalse(Z)Z
    .registers 2

    if-eqz p0, :cond_c

    sget-object v0, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    invoke-virtual {v0}, Lcom/android/server/am/PreventRunning;->isActiviated()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public static setSender(Landroid/app/IApplicationThread;)V
    .registers 3

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->getAms()Lcom/android/server/am/ActivityManagerService;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/server/am/ActivityManagerService;->getRecordForAppLocked(Landroid/app/IApplicationThread;)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    sget-object v1, Lcom/android/server/am/PreventRunningUtils;->mPreventRunning:Lcom/android/server/am/PreventRunning;

    if-eqz v0, :cond_14

    iget-object v0, v0, Lcom/android/server/am/ProcessRecord;->info:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    :goto_10
    invoke-virtual {v1, v0}, Lcom/android/server/am/PreventRunning;->setSender(Ljava/lang/String;)V

    return-void

    :cond_14
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method
