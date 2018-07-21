#!/system/bin/sh
#Author: Asiier
#Settings By: Asiier
#Device: One Plus 3
#Codename: GhostPepper
#Build Status: Stable
#Version: 2.0
#Last Updated: 15/12/2016
#Notes: Please give credit when using this in your work!
#TWEAKS_BEGIN
echo ""
echo -----------------------------------------------
echo Applying 'GhostPepper' v2.0
echo Advanced Kernel Settings
echo -----------------------------------------------

echo Author: Asiier
echo Settings By: Asiier
echo Codename: 'GhostPepper'
echo Build Status: BETA
echo Last Updated: 09/02/2017
echo For more information go to the XDA theard
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

echo Checking Android version...
if grep -q 'ro.build.version.sdk=25' /system/build.prop; then
	echo Android Nougat 7.1.X detected!
	
	echo N detected... Applying proper settings
fi
if grep -q 'ro.build.version.sdk=24' /system/build.prop; then
	echo Android Nougat 7.0.X detected!
	
	echo N detected... Applying proper settings
fi
if grep -q 'ro.build.version.sdk=23' /system/build.prop; then
	echo Android Marshmallow 6.0.1 detected!
	
	echo MM detected... Applying proper settings
fi
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#Apply settings to LITTLE cluster
echo Applying settings to LITTLE Cluster...

#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
#Grab Maximum Achievable Frequency for the LITTLE Cluster
maxfreq=$(cat "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq")                
if test $maxfreq -eq 1593600; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 1593MHz
    echo No LITTLE Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 1593600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1593MHz         
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 45 460800:35 537600:49 844800:60 902400:75 1132800:85 1286400:90 1440000:95 1593600:100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
elif test $maxfreq -eq 1728000; then
    #Temporarily change permissions to governor files for the Little cluster to set the maximum frequency to 1728MHz
    echo LITTLE Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    echo 1728000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1728MHz         
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 45 460800:35 537600:49 844800:60 902400:75 1132800:85 1286400:90 1440000:95 1593600:98 1728000:100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    maxfreq=$(cat "/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq")
fi
if test $maxfreq -lt 1593600; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 1593MHz
    echo LITTLE Cluster Underclocking detected!!
    
    echo We recommend not to UnderClock the CPU as the tweaks already will take care of that If needed
    echo The tweaks will continue getting applied but we recommend setting the CPU to Max frequency!
    
    #chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    #echo 1593600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1593MHz         
    #chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 45 460800:35 537600:49 844800:60 902400:75 1132800:85 1286400:90 1440000:95 1593600:100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
elif test $maxfreq -gt 1728000; then
    #Temporarily change permissions to governor files for the Little cluster to set the maximum frequency to 1728MHz
    echo LITTLE Cluster Overclocking detected. 
    
    echo This OverClock is higher than normal and only possible on Xceed Kernel
    echo The tweak will continue getting applyed
    echo " Althought it might no reach the maximum frequency you have setted as it haven't been made to work with frecuencies higher than 1728 Mhz "
    #chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    #echo 1728000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1728MHz         
    #chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
    echo 45 460800:35 537600:49 844800:60 902400:75 1132800:85 1286400:90 1440000:95 1593600:98 1728000:100 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
fi
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/*
echo -1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_slack
echo 307200 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 42000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/timer_rate
echo 22000 537600:15000 768000:32000 1209600:30000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/above_hispeed_delay
echo 300 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 45000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/max_freq_hysteresis
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boost
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/fast_ramp_down
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/io_is_busy
if [ -e "/sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction" ]; then
    chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction
    echo 1 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/enable_prediction
fi

#Apply settings to Big cluster
echo Applying settings to BIG Cluster

#Temporarily change permissions to governor files for the LITTLE cluster to enable Interactive governor
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo interactive > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
#Grab Maximum Achievable Frequency for the Big Cluster
maxfreq=$(cat "/sys/devices/system/cpu/cpu2/cpufreq/cpuinfo_max_freq")                
if test $maxfreq -eq 2342400; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 2150MHz
    echo No BIG Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    echo 2150400 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq     #Core 2 Maximum Frequency = 2150MHz         
    chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads
    echo 35 748800:30 902400:32 1132800:35 1286400:37 1440000:65 1670400:72 1747200:85 1824000:99 1977600:99 2342400:100 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads 
chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads
#Set overclock max frequency compatible target_loads
elif test $maxfreq -eq 2342400; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 2265MHz
    echo BIG Cluster Overclocking detected. 
    echo Applying appropriate values.
    chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    echo 2265600 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq     #Core 2 Maximum Frequency = 2265MHz         
    chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads
    echo 35 748800:30 902400:32 1132800:35 1286400:37 1440000:65 1670400:72 1747200:85 1824000:99 1977600:99 2342400:100 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads
fi
if test $maxfreq -lt 2342400; then
    #Temporarily change permissions to governor files for the Big cluster to set the maximum frequency to 1593MHz
    echo BIG Cluster Underclocking detected!!
    
    echo We recommend not to UnderClock the CPU as the tweaks already will take care of that If needed
    echo The tweaks will continue getting applied but we recommend setting the CPU to Max frequency!
    
    #chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    #echo 1593600 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1593MHz         
    #chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads
    echo 35 748800:30 902400:32 1132800:35 1286400:37 1440000:65 1670400:72 1747200:85 1824000:99 1977600:99 2342400:100 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads
elif test $maxfreq -gt 2342400; then
    #Temporarily change permissions to governor files for the Little cluster to set the maximum frequency to 1728MHz
    echo BIG Cluster Overclocking detected. 
    
    echo This OverClock is higher than normal and only possible on Xceed Kernel
    echo The tweak will continue getting applyed
    echo " Althought it might no reach the maximum frequency you have setted as it haven't been made to work with frecuencies higher than 2265600 Mhz "
    
    #chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    #echo 1728000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq     #Core 0 Maximum Frequency = 1728MHz         
    #chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
    chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads
    echo 35 748800:30 902400:32 1132800:35 1286400:37 1440000:65 1670400:72 1747200:85 1824000:99 1977600:99 2342400:100 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads 
    chmod 444 /sys/devices/system/cpu/cpu2/cpufreq/interactive/target_loads
fi

#Tweak Interactive Governor
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/interactive/*
echo -1 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/timer_slack
echo 307200 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/hispeed_freq
echo 40000 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/timer_rate
echo 40000 902400:55000 1286400:33000 1670400:32000 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/above_hispeed_delay
echo 300 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/go_hispeed_load
echo 40000 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/min_sample_time
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/max_freq_hysteresis
echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/ignore_hispeed_on_notif
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/boost
echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/fast_ramp_down
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/align_windows
echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/use_migration_notif
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/use_sched_load
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/boostpulse_duration
echo 0 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/io_is_busy
if [ -e "/sys/devices/system/cpu/cpu2/cpufreq/interactive/enable_prediction" ]; then
    chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/interactive/enable_prediction
    echo 1 > /sys/devices/system/cpu/cpu2/cpufreq/interactive/enable_prediction
fi

echo "=========================================="
echo Checking whether you are using a Sultanxda based ROM or not
echo "=========================================="
#Checking whether you are using a Sultanxda based ROM or not
echo Checking ROM...

echo Applying appropriate values.
if [ -e "/sys/kernel/cpu_input_boost/enabled" ]; then
    echo Enabling Input Boost for the LITTLE cluster @748 MHz and for the BIG Cluster @902 Mhz and Custom thermal driver of Sultanxda
    chmod 644 /sys/kernel/cpu_input_boost/*
    echo 1 > /sys/kernel/cpu_input_boost/enabled
    echo 35 > /sys/kernel/cpu_input_boost/ib_duration_ms
    echo 748800 902400 > /sys/kernel/cpu_input_boost/ib_freqs
    chmod 444 /sys/kernel/cpu_input_boost/*
    chmod 644 /sys/kernel/msm_thermal/enabled
    echo 0 > /sys/kernel/msm_thermal/enabled
    chmod 444 /sys/kernel/msm_thermal/enabled
else
#Checking whether you are using a Lineage based ROM or not
echo Checking ROM...

if grep -q 'ro.build.flavor=lineage_oneplus3-userdebug' /system/build.prop; then
#Enable Input Boost for LITTLE cluster @556MHz and for BIG cluster @729MHz for 66ms
echo Lineage Based ROM detected
echo Applying appropriate values.
echo Enabling Input Boost at 748 MHz for the LITTLE cluster and at 902 MHz for the BIG Cluster
if [ -e "/sys/module/cpu_boost/parameters/input_boost_freq" ]; then
chmod 644 /sys/module/cpu_boost/parameters/input_boost_freq
echo 0:748800  1:0 2:902400 3:0 > /sys/module/cpu_boost/parameters/input_boost_freq
chmod 644 /sys/module/cpu_boost/parameters/input_boost_ms
echo 35 > /sys/module/cpu_boost/parameters/input_boost_ms
else
echo "*Input Boost is not avalible for your Kernel*"
fi
if [ -e "/sys/module/cpu_boost/parameters/boost_ms" ]; then
chmod 644 /sys/module/cpu_boost/parameters/boost_ms
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
else
echo "*Cpu_Boost is not avalible for your Kernel*"
fi
else
#Enable Input Boost for LITTLE cluster @748 MHz and for BIG cluster @902 MHz for 100ms
echo Non-Lineage ROM detected
echo Applying appropriate values.
echo Enabling Input Boost at 748 MHz for the LITTLE cluster and at 940 MHz for the BIG Cluster
if [ -e "/sys/module/cpu_boost/parameters/input_boost_freq" ]; then
chmod 644 /sys/module/cpu_boost/parameters/input_boost_freq
echo 0:748800  1:0 2:902400 3:0 > /sys/module/cpu_boost/parameters/input_boost_freq
chmod 644 /sys/module/cpu_boost/parameters/input_boost_ms
echo 35 > /sys/module/cpu_boost/parameters/input_boost_ms
else
echo "*Input Boost is not avalible for your Kernel*"
fi
if [ -e "/sys/module/cpu_boost/parameters/boost_ms" ]; then
chmod 644 /sys/module/cpu_boost/parameters/boost_ms
echo 0 > /sys/module/cpu_boost/parameters/boost_ms
else
echo "*Cpu_Boost is not avalible for your Kernel*"
fi
fi
fi

echo "=========================================="
#Disable TouchBoost
echo Disabling TouchBoost
    if [ -e "/sys/module/msm_performance/parameters/touchboost" ]; then
    chmod 644 /sys/module/msm_performance/parameters/touchboost
    echo 0 > /sys/module/msm_performance/parameters/touchboost
else
    echo "*Not supported for your current Kernel*"
fi
#Disable BCL
echo Disabling BCL and Removing Perfd
if [ -e "/sys/devices/soc/soc:qcom,bcl/mode" ]; then
echo -n disable > /sys/devices/soc/soc:qcom,bcl/mode
fi
#Enable Core Control and Disable MSM Thermal Throttling allowing for longer sustained performance
echo Disabling Aggressive CPU Thermal Throttling
if [ -e "/sys/module/msm_thermal/core_control/enabled" ]; then
echo 1 > /sys/module/msm_thermal/core_control/enabled
fi
if [ -e "/sys/module/msm_thermal/parameters/enabled" ]; then
echo N > /sys/module/msm_thermal/parameters/enabled
fi
#Tweak HMP Scheduler to feed the Big cluster more tasks

#echo Tweaking HMP Scheduler for correcting BIG Cluster utilization
#echo 2 > /proc/sys/kernel/sched_window_stats_policy
#echo 95 > /proc/sys/kernel/sched_upmigrate
#echo 80 > /proc/sys/kernel/sched_downmigrate
#echo 5 > /proc/sys/kernel/sched_spill_nr_run
#echo 96 > /proc/sys/kernel/sched_spill_load
#echo 40 > /proc/sys/kernel/sched_init_task_load
#if [ -e "/proc/sys/kernel/sched_heavy_task" ]; then
    #echo 96 > /proc/sys/kernel/sched_heavy_task
#fi
#if [ -e "/proc/sys/kernel/sched_enable_power_aware" ]; then
    #echo 1 > /proc/sys/kernel/sched_enable_power_aware
#fi
#echo 5 > /proc/sys/kernel/sched_upmigrate_min_nice
#echo 4 > /proc/sys/kernel/sched_ravg_hist_size
#echo 5 > /proc/sys/kernel/sched_small_wakee_task_load
#echo 110 > /proc/sys/kernel/sched_wakeup_load_threshold
#echo 21 > /proc/sys/kernel/sched_small_task
#echo 950000 > /proc/sys/kernel/sched_rt_runtime_us
#echo 1000000 > /proc/sys/kernel/sched_rt_period_us
#echo 1 > /proc/sys/kernel/sched_migration_fixup
if [ -e "/proc/sys/kernel/sched_freq_dec_notify" ]; then
	echo 410000 > /proc/sys/kernel/sched_freq_dec_notify
fi
if [ -e "/proc/sys/kernel/sched_freq_inc_notify" ]; then
	echo 600000 > /proc/sys/kernel/sched_freq_inc_notify
fi
#echo 0 > /proc/sys/kernel/sched_boost
#Tweaks for other various Settings

echo "=========================================="
echo Tweaking other various Settings
echo I/O Values
if [ -d /sys/block/dm-0 ] || [ -d /sys/devices/virtual/block/dm-0 ]; then
if [ -e /sys/devices/virtual/block/dm-0/queue/scheduler ]; then
    DM_PATH=/sys/devices/virtual/block/dm-0/queue
fi
if [ -e /sys/block/dm-0/queue/scheduler ]; then
    DM_PATH=/sys/block/dm-0/queue
fi
string=/sys/devices/virtual/block/dm-0/queue/scheduler;
Zen_Available=false;
if [ "$Zen_Available" == "true" ]; then
    if [ -e $DM_PATH/scheduler_hard ]; then
        echo zen > $DM_PATH/scheduler_hard
    fi
    echo zen > $DM_PATH/scheduler
    
    echo 300 > $DM_PATH/iosched/sync_expire
    echo 3000 > $DM_PATH/iosched/async_expire
    echo 14 > $DM_PATH/iosched/fifo_batch
    chmod 644 $DM_PATH/iosched/sync_expire
    echo 300 > $DM_PATH/iosched/sync_expire
fi
if [ "$Zen_Available" = "false" ]; then
    if grep -q 'ro.build.flavor=lineage_oneplus3-userdebug' /system/build.prop; then
        echo ZEN not avalible, setting 'Noop' instead...	
        if [ -e $DM_PATH/scheduler_hard ]; then
           echo noop > $DM_PATH/scheduler_hard
        fi
        echo noop > $DM_PATH/scheduler
    else
        echo ZEN not avalible, setting 'CFQ' instead...	
        if [ -e $DM_PATH/scheduler_hard ]; then
           echo cfq > $DM_PATH/scheduler_hard
        fi
        echo cfq > $DM_PATH/scheduler
    fi
fi
fi
for i in /sys/block/../devices/soc/624000.ufshc/host0/target0:0:0/0:0:0:[0-4]/block/*/queue; do
  string4=$($BB readlink -f $i/scheduler | cut -d 'q' -f1 | cut -d 'k' -f2 | cut -d '/' -f2 | tr a-z A-Z)
  string5=$($BB cat $i/scheduler | cut -d ']' -f1 | cut -d '[' -f2 | $BB tr a-z A-Z)
  if [ "$string5" == "NOOP" ]; then
      echo "Leaving $string4 block at default $string5"
      echo ""
      
  fi
  if [ "$string5" != "NOOP" ]; then
      echo "Changing $string4 block I/O scheduler"
      if [ -e $i/scheduler_hard ]; then
          echo zen > $i/scheduler_hard
      fi
      echo zen > $i/scheduler
      echo ""
      
      # Initialize string 6 to avoid reference conflicts
      string6=$($BB cat $i/scheduler | cut -d ']' -f1 | cut -d '[' -f2)
      if [ "$string6" == "zen" ]; then
         echo 300 > $i/iosched/sync_expire
         echo 3000 > $i/iosched/async_expire
         echo 14 > $i/iosched/fifo_batch
        chmod 644 $i/iosched/sync_expire
        echo 300 > $i/iosched/sync_expire
    fi
  fi
done
if [ -e "$DM_PATH/iostats" ]; then
	echo 0 > $DM_PATH/iostats
fi
if [ -e "$DM_PATH/rq_affinity" ]; then
	echo 1 > $DM_PATH/rq_affinity
fi
if [ -e "/sys/block/dm-0/bdi/read_ahead_kb" ]; then
	echo 512 > /sys/devices/virtual/block/dm-0/bdi/read_ahead_kb
fi
if [ -e "/sys/block/sda/bdi/read_ahead_kb" ]; then
	echo 512 > /sys/block/sda/bdi/read_ahead_kb
fi
echo Memory Values
echo 20 > /proc/sys/vm/swappiness
echo 100 > /proc/sys/vm/vfs_cache_pressure
echo 80 > /proc/sys/vm/dirty_ratio
echo 50 > /proc/sys/vm/dirty_background_ratio
echo 4096 > /proc/sys/vm/min_free_kbytes
if [ -e "/sys/module/lowmemorykiller/parameters/enable_adaptive_lmk" ]; then
	echo 0 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
else
	echo ' *Adaptive LMK is not present on your Kernel* '
fi
if [ -e "/sys/module/lowmemorykiller/parameters/minfree" ]; then
	echo 23939,44091,58788,73485,88182,102879 > /sys/module/lowmemorykiller/parameters/minfree
else
	echo ' *LMK cannot currently be modified on your Kernel* '
fi
if [ -e "/sys/module/lowmemorykiller/parameters/enable_adaptive_lmk" ]; then
chmod 666 /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
chown root /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
echo 0 > /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk
fi
echo TCP Values
string2=/proc/sys/net/ipv4/tcp_available_congestion_control
if $BB grep 'westwood' $string2; then
   echo westwood > /proc/sys/net/ipv4/tcp_congestion_control
else
	echo Westwood not avilable, using Cubic
	echo cubic > /proc/sys/net/ipv4/tcp_congestion_control 
fi
#Tweaking GPU

echo GPU Tweaking
echo msm-adreno-tz > /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/governor
if grep -q 'ro.build.version.sdk=25' /system/build.prop; then
	if grep -q 'ro.build.flavor=lineage_oneplus3-userdebug' /system/build.prop; then
   		echo 560000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
	else
    		echo 624000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
	fi
fi
if grep -q 'ro.build.version.sdk=24' /system/build.prop; then
	if grep -q 'ro.build.flavor=lineage_oneplus3-userdebug' /system/build.prop; then
   		echo 560000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
	else
    		echo 624000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
	fi
fi
if grep -q 'ro.build.version.sdk=23' /system/build.prop; then
	if grep -q 'ro.build.flavor=lineage_oneplus3-userdebug' /system/build.prop; then
   		echo 560000000 > /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/max_freq
	else
    		echo 624000000 > /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/max_freq
	fi
	else
	if grep -q 'ro.build.flavor=lineage_oneplus3-userdebug' /system/build.prop; then
   		echo 560000000 > /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/max_freq
	else
    		echo 624000000 > /sys/devices/soc/b00000.qcom,kgsl-3d0/devfreq/b00000.qcom,kgsl-3d0/max_freq
	fi
fi

echo ------------------------------------------------------------
echo 'GhostPepper v2.0' Successfully Applied!
echo "GhostPepper V2.0" > /data/system/current_profile
echo   You may now tweak them further
echo    using EXKM or Kernel Adiutor
echo ------------------------------------------------------------