.class public abstract Lcom/android/server/am/ActivityManagerService;
.super Ljava/lang/Object;
.source "ActivityManagerService.java"

# interfaces
.implements Landroid/os/IBinder;


# instance fields
.field mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private cleanUpRemovedTaskLocked(Lcom/android/server/am/TaskRecord;I)V
    .registers 6

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/android/server/am/ActivityManagerService;->cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;I)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_19

    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_15

    new-instance v1, Landroid/content/Intent;

    iget-object v0, p1, Lcom/android/server/am/TaskRecord;->intent:Landroid/content/Intent;

    if-eqz v0, :cond_16

    iget-object v0, p1, Lcom/android/server/am/TaskRecord;->intent:Landroid/content/Intent;

    :goto_f
    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-static {v1}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_15
    return-void

    :cond_16
    iget-object v0, p1, Lcom/android/server/am/TaskRecord;->affinityIntent:Landroid/content/Intent;

    goto :goto_f

    :catchall_19
    move-exception v1

    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_2c

    new-instance v2, Landroid/content/Intent;

    iget-object v0, p1, Lcom/android/server/am/TaskRecord;->intent:Landroid/content/Intent;

    if-eqz v0, :cond_2d

    iget-object v0, p1, Lcom/android/server/am/TaskRecord;->intent:Landroid/content/Intent;

    :goto_26
    invoke-direct {v2, v0}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-static {v2}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_2c
    throw v1

    :cond_2d
    iget-object v0, p1, Lcom/android/server/am/TaskRecord;->affinityIntent:Landroid/content/Intent;

    goto :goto_26
.end method

.method private cleanUpRemovedTaskLocked(Lcom/android/server/am/TaskRecord;Z)V
    .registers 5

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/android/server/am/ActivityManagerService;->cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;Z)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_d

    if-eqz p2, :cond_c

    invoke-virtual {p1}, Lcom/android/server/am/TaskRecord;->getBaseIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    if-eqz p2, :cond_17

    invoke-virtual {p1}, Lcom/android/server/am/TaskRecord;->getBaseIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_17
    throw v0
.end method

.method private cleanUpRemovedTaskLocked(Lcom/android/server/am/TaskRecord;ZI)V
    .registers 6

    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/am/ActivityManagerService;->cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;ZI)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_d

    if-eqz p2, :cond_c

    invoke-virtual {p1}, Lcom/android/server/am/TaskRecord;->getBaseIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    if-eqz p2, :cond_17

    invoke-virtual {p1}, Lcom/android/server/am/TaskRecord;->getBaseIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_17
    throw v0
.end method

.method private cleanUpRemovedTaskLocked(Lcom/android/server/am/TaskRecord;ZZ)V
    .registers 6

    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/am/ActivityManagerService;->cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;ZZ)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_d

    if-eqz p2, :cond_c

    invoke-virtual {p1}, Lcom/android/server/am/TaskRecord;->getBaseIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_c
    return-void

    :catchall_d
    move-exception v0

    if-eqz p2, :cond_17

    invoke-virtual {p1}, Lcom/android/server/am/TaskRecord;->getBaseIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_17
    throw v0
.end method

.method private cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;I)V
    .registers 4

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;Z)V
    .registers 4

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;ZI)V
    .registers 5

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;ZZ)V
    .registers 5

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private final handleAppDiedLocked(Lcom/android/server/am/ProcessRecord;ZZ)V
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/am/ActivityManagerService;->handleAppDiedLocked$Pr(Lcom/android/server/am/ProcessRecord;ZZ)V

    if-nez p2, :cond_e

    if-eqz p3, :cond_e

    iget-boolean v0, p1, Lcom/android/server/am/ProcessRecord;->killedByAm:Z

    if-nez v0, :cond_e

    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->onAppDied(Lcom/android/server/am/ProcessRecord;)V

    :cond_e
    return-void
.end method

.method private final handleAppDiedLocked$Pr(Lcom/android/server/am/ProcessRecord;ZZ)V
    .registers 5

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private final handleAppDiedLocked(Lcom/android/server/am/ProcessRecord;ZZZ)V
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/server/am/ActivityManagerService;->handleAppDiedLocked$Pr(Lcom/android/server/am/ProcessRecord;ZZZ)V

    if-nez p2, :cond_e

    if-eqz p3, :cond_e

    iget-boolean v0, p1, Lcom/android/server/am/ProcessRecord;->killedByAm:Z

    if-nez v0, :cond_e

    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->onAppDied(Lcom/android/server/am/ProcessRecord;)V

    :cond_e
    return-void
.end method

.method private final handleAppDiedLocked$Pr(Lcom/android/server/am/ProcessRecord;ZZZ)V
    .registers 5

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

# virtual methods
.method public bindService(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;Ljava/lang/String;Landroid/app/IServiceConnection;II)I
    .registers 9

    :try_start_0
    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    invoke-static {p1, p2, p3}, Lcom/android/server/am/PreventRunningUtils;->hookBindService(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual/range {p0 .. p7}, Lcom/android/server/am/ActivityManagerService;->bindService$Pr(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;Ljava/lang/String;Landroid/app/IServiceConnection;II)I
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_16

    move-result v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    goto :goto_10

    :catchall_16
    move-exception v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    throw v0
.end method

.method public bindService(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;Ljava/lang/String;Landroid/app/IServiceConnection;ILjava/lang/String;I)I
    .registers 10

    :try_start_0
    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    invoke-static {p1, p2, p3}, Lcom/android/server/am/PreventRunningUtils;->hookBindService(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual/range {p0 .. p8}, Lcom/android/server/am/ActivityManagerService;->bindService$Pr(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;Ljava/lang/String;Landroid/app/IServiceConnection;ILjava/lang/String;I)I
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_16

    move-result v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    goto :goto_10

    :catchall_16
    move-exception v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    throw v0
.end method

.method public bindService$Pr(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;Ljava/lang/String;Landroid/app/IServiceConnection;II)I
    .registers 9

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public bindService$Pr(Landroid/app/IApplicationThread;Landroid/os/IBinder;Landroid/content/Intent;Ljava/lang/String;Landroid/app/IServiceConnection;ILjava/lang/String;I)I
    .registers 10

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public final broadcastIntent(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Landroid/content/IIntentReceiver;ILjava/lang/String;Landroid/os/Bundle;Ljava/lang/String;IZZI)I
    .registers 14

    :try_start_0
    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    invoke-virtual/range {p0 .. p12}, Lcom/android/server/am/ActivityManagerService;->broadcastIntent$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Landroid/content/IIntentReceiver;ILjava/lang/String;Landroid/os/Bundle;Ljava/lang/String;IZZI)I

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p2}, Lcom/android/server/am/PreventRunningUtils;->onBroadcastIntent(Landroid/content/Intent;)V
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_10

    :cond_c
    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    return v0

    :catchall_10
    move-exception v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    throw v0
.end method

.method public final broadcastIntent(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Landroid/content/IIntentReceiver;ILjava/lang/String;Landroid/os/Bundle;[Ljava/lang/String;ILandroid/os/Bundle;ZZI)I
    .registers 15

    :try_start_0
    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    invoke-virtual/range {p0 .. p13}, Lcom/android/server/am/ActivityManagerService;->broadcastIntent$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Landroid/content/IIntentReceiver;ILjava/lang/String;Landroid/os/Bundle;[Ljava/lang/String;ILandroid/os/Bundle;ZZI)I

    move-result v0

    if-nez v0, :cond_c

    invoke-static {p2}, Lcom/android/server/am/PreventRunningUtils;->onBroadcastIntent(Landroid/content/Intent;)V
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_10

    :cond_c
    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    return v0

    :catchall_10
    move-exception v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    throw v0
.end method

.method public final broadcastIntent$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Landroid/content/IIntentReceiver;ILjava/lang/String;Landroid/os/Bundle;Ljava/lang/String;IZZI)I
    .registers 14

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public final broadcastIntent$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Landroid/content/IIntentReceiver;ILjava/lang/String;Landroid/os/Bundle;[Ljava/lang/String;ILandroid/os/Bundle;ZZI)I
    .registers 15

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method getRecordForAppLocked(Landroid/app/IApplicationThread;)Lcom/android/server/am/ProcessRecord;
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public moveActivityTaskToBack(Landroid/os/IBinder;Z)Z
    .registers 4

    invoke-virtual {p0, p1, p2}, Lcom/android/server/am/ActivityManagerService;->moveActivityTaskToBack$Pr(Landroid/os/IBinder;Z)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->onMoveActivityTaskToBack(Landroid/os/IBinder;)V

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public moveActivityTaskToBack$Pr(Landroid/os/IBinder;Z)Z
    .registers 4

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public final startActivity(Landroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILandroid/app/ProfilerInfo;Landroid/os/Bundle;)I
    .registers 12

    invoke-virtual/range {p0 .. p10}, Lcom/android/server/am/ActivityManagerService;->startActivity$Pr(Landroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILandroid/app/ProfilerInfo;Landroid/os/Bundle;)I

    move-result v0

    invoke-static {v0, p1, p2, p3}, Lcom/android/server/am/PreventRunningUtils;->onStartActivity(ILandroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;)I

    move-result v0

    return v0
.end method

.method public final startActivity(Landroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILjava/lang/String;Landroid/os/ParcelFileDescriptor;Landroid/os/Bundle;)I
    .registers 13

    invoke-virtual/range {p0 .. p11}, Lcom/android/server/am/ActivityManagerService;->startActivity$Pr(Landroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILjava/lang/String;Landroid/os/ParcelFileDescriptor;Landroid/os/Bundle;)I

    move-result v0

    invoke-static {v0, p1, p2, p3}, Lcom/android/server/am/PreventRunningUtils;->onStartActivity(ILandroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;)I

    move-result v0

    return v0
.end method

.method public final startActivity$Pr(Landroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILandroid/app/ProfilerInfo;Landroid/os/Bundle;)I
    .registers 12

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public final startActivity$Pr(Landroid/app/IApplicationThread;Ljava/lang/String;Landroid/content/Intent;Ljava/lang/String;Landroid/os/IBinder;Ljava/lang/String;IILjava/lang/String;Landroid/os/ParcelFileDescriptor;Landroid/os/Bundle;)I
    .registers 13

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method final startProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZIZLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Runnable;)Lcom/android/server/am/ProcessRecord;
    .registers 16

    invoke-static/range {p1 .. p6}, Lcom/android/server/am/PreventRunningUtils;->hookStartProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual/range {p0 .. p14}, Lcom/android/server/am/ActivityManagerService;->startProcessLocked$Pr(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZIZLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Runnable;)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method final startProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZIZLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)Lcom/android/server/am/ProcessRecord;
    .registers 18

    invoke-static/range {p1 .. p6}, Lcom/android/server/am/PreventRunningUtils;->hookStartProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual/range {p0 .. p15}, Lcom/android/server/am/ActivityManagerService;->startProcessLocked$Pr(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZIZLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method final startProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZZ)Lcom/android/server/am/ProcessRecord;
    .registers 11

    invoke-static/range {p1 .. p6}, Lcom/android/server/am/PreventRunningUtils;->hookStartProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual/range {p0 .. p9}, Lcom/android/server/am/ActivityManagerService;->startProcessLocked$Pr(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZZ)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method final startProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZZZ)Lcom/android/server/am/ProcessRecord;
    .registers 12

    invoke-static/range {p1 .. p6}, Lcom/android/server/am/PreventRunningUtils;->hookStartProcessLocked(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual/range {p0 .. p10}, Lcom/android/server/am/ActivityManagerService;->startProcessLocked$Pr(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZZ)Lcom/android/server/am/ProcessRecord;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method


.method final startProcessLocked$Pr(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZIZLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Runnable;)Lcom/android/server/am/ProcessRecord;
    .registers 16

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method final startProcessLocked$Pr(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZIZLjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/String;)Lcom/android/server/am/ProcessRecord;
    .registers 18

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method final startProcessLocked$Pr(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZZ)Lcom/android/server/am/ProcessRecord;
    .registers 11

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method final startProcessLocked$Pr(Ljava/lang/String;Landroid/content/pm/ApplicationInfo;ZILjava/lang/String;Landroid/content/ComponentName;ZZZZ)Lcom/android/server/am/ProcessRecord;
    .registers 12

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method


.method public startService(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;I)Landroid/content/ComponentName;
    .registers 6

    :try_start_0
    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    invoke-static {p1, p2}, Lcom/android/server/am/PreventRunningUtils;->hookStartService(Landroid/app/IApplicationThread;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/server/am/ActivityManagerService;->startService$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;I)Landroid/content/ComponentName;
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_16

    move-result-object v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    goto :goto_10

    :catchall_16
    move-exception v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    throw v0
.end method

.method public startService(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;I)Landroid/content/ComponentName;
    .registers 7

    :try_start_0
    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    invoke-static {p1, p2}, Lcom/android/server/am/PreventRunningUtils;->hookStartService(Landroid/app/IApplicationThread;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-virtual/range {p0 .. p5}, Lcom/android/server/am/ActivityManagerService;->startService$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;I)Landroid/content/ComponentName;
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_16

    move-result-object v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    :goto_10
    return-object v0

    :cond_11
    const/4 v0, 0x0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    goto :goto_10

    :catchall_16
    move-exception v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    throw v0
.end method

.method public startService(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;ZLjava/lang/String;I)Landroid/content/ComponentName;
    .registers 8

    .prologue
    :try_start_0
    invoke-static {p1}, Lcom/android/server/am/PreventRunningUtils;->setSender(Landroid/app/IApplicationThread;)V

    invoke-static {p1, p2}, Lcom/android/server/am/PreventRunningUtils;->hookStartService(Landroid/app/IApplicationThread;Landroid/content/Intent;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual/range {p0 .. p6}, Lcom/android/server/am/ActivityManagerService;->startService$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;ZLjava/lang/String;I)Landroid/content/ComponentName;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    return-object v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/android/server/am/PreventRunningUtils;->clearSender()V

    throw v0
.end method

.method public startService$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;I)Landroid/content/ComponentName;
    .registers 6

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public startService$Pr(Landroid/app/IApplicationThread;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;I)Landroid/content/ComponentName;
    .registers 7

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
