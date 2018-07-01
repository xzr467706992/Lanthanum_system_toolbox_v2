.method cleanUpRemovedTaskLocked(Lcom/android/server/am/TaskRecord;ZZ)V
    .registers 6

    .prologue
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lcom/android/server/am/ActivityStackSupervisor;->cleanUpRemovedTaskLocked$Pr(Lcom/android/server/am/TaskRecord;ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/android/server/am/TaskRecord;->getBaseIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Lcom/android/server/am/TaskRecord;->getBaseIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-static {v1}, Lcom/android/server/am/PreventRunningUtils;->onCleanUpRemovedTask(Landroid/content/Intent;)V

    :cond_1
    throw v0
.end method
