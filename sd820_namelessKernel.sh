#!/system/bin/sh
#Auto generate by Lanthanum system toolbox 2.0.0B5(18071900)
#switch
setenforce 0

    
#switch
echo 1 > /sys/kernel/sched/arch_power

#edittext
echo 95 > /proc/sys/kernel/sched_upmigrate

#edittext
echo 90 > /proc/sys/kernel/sched_downmigrate

#edittext
echo 3 > /proc/sys/kernel/sched_spill_nr_run

#edittext
echo 100 > /proc/sys/kernel/sched_spill_load

#edittext
chmod 644 /dev/cpuset/background/cpus
echo 0-1 > /dev/cpuset/background/cpus

#edittext
chmod 644 /dev/cpuset/foreground/cpus
echo 0-2 > /dev/cpuset/foreground/cpus

#edittext
chmod 644 /dev/cpuset/foreground/boost/cpus
echo 0-2 > /dev/cpuset/foreground/boost/cpus

#edittext
chmod 644 /dev/cpuset/top-app/cpus
echo 0-3 > /dev/cpuset/top-app/cpus

#edittext
chmod 644 /dev/cpuset/system-background/cpus
echo 0-2 > /dev/cpuset/system-background/cpus

#edittext
chmod 644 /dev/cpuset/camera-daemon/cpus
echo 0-3 > /dev/cpuset/camera-daemon/cpus

#switch
echo 1 > /sys/module/cpu_boost/parameters/input_boost_enabled

#edittext
echo "0:729600 1:0 2:940800 3:0 
" > /sys/module/cpu_boost/parameters/input_boost_freq

#edittext
echo 35 > /sys/module/cpu_boost/parameters/input_boost_ms

#switch
mount -o rw,remount /system
mount -o rw,remount /vendor
if [ 0 == 1 ]
then
mv /system/vendor/etc/perf/perfboostsconfig.xml.bak /system/vendor/etc/perf/perfboostsconfig.xml
else
mv /system/vendor/etc/perf/perfboostsconfig.xml /system/vendor/etc/perf/perfboostsconfig.xml.bak
fi
mount -o ro,remount /system
mount -o ro,remount /vendor
echo @toast=建议刷新页面检查是否更改成功，一切更改将在重启后生效。
echo @ierror

#seekbar
let r=6-0
echo $r > /sys/class/kgsl/kgsl-3d0/default_pwrlevel

#switch
echo 1 > /sys/module/msm_thermal/core_control/enabled

#switch
echo 0 > /sys/module/msm_thermal/vdd_restriction/enabled

#switch
echo 0 > /sys/module/msm_thermal/parameters/enabled

#switch
t=/vendor/bin/thermal-engine
mount -o rw,remount /system
mount -o rw,remount /vendor
if [ 1 == 1 ]
then
chmod 755 $t
else
chmod 0 $t
fi
mount -o ro,remount /system
mount -o ro,remount /vendor
echo @ierror
echo @toast=建议刷新页面检查是否更改成功，一切更改将在重启后生效。

#switch
echo 0 > /sys/module/msm_performance/parameters/touchboost


echo "22000 537600:15000 768000:32000 1209600:30000" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/above_hispeed_delay
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/align_windows
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/boost
echo "" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/boostpulse
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/boostpulse_duration
echo "1" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/enable_prediction
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/fast_ramp_down
echo "300" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/go_hispeed_load
echo "307200" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/hispeed_freq
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/ignore_hispeed_on_notif
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/io_is_busy
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/max_freq_hysteresis
echo "45000" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/min_sample_time
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/powersave_bias
echo "1286400" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/screen_off_maxfreq
echo "45 460800:35 537600:49 844800:60 902400:75 1132800:85 1286400:90 1440000:95 1593600:99" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/target_loads
echo "50000" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/timer_rate
echo "-1" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/timer_slack
echo "1" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/use_migration_notif
echo "0" > /sys/bus/cpu/devices/cpu0/cpufreq/interactive/use_sched_load
chmod 777 /sys/bus/cpu/devices/cpu0/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu0/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu0/cpufreq/scaling_governor
echo "1593600" > /sys/bus/cpu/devices/cpu0/cpufreq/scaling_max_freq
echo "307200" > /sys/bus/cpu/devices/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu0/online
echo "1" > /sys/bus/cpu/devices/cpu0/online
chmod 444 /sys/bus/cpu/devices/cpu0/online
echo "22000 537600:15000 768000:32000 1209600:30000" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/above_hispeed_delay
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/align_windows
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/boost
echo "" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/boostpulse
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/boostpulse_duration
echo "1" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/enable_prediction
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/fast_ramp_down
echo "300" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/go_hispeed_load
echo "307200" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/hispeed_freq
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/ignore_hispeed_on_notif
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/io_is_busy
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/max_freq_hysteresis
echo "45000" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/min_sample_time
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/powersave_bias
echo "1286400" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/screen_off_maxfreq
echo "45 460800:35 537600:49 844800:60 902400:75 1132800:85 1286400:90 1440000:95 1593600:99" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/target_loads
echo "50000" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/timer_rate
echo "-1" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/timer_slack
echo "1" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/use_migration_notif
echo "0" > /sys/bus/cpu/devices/cpu1/cpufreq/interactive/use_sched_load
chmod 777 /sys/bus/cpu/devices/cpu1/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu1/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu1/cpufreq/scaling_governor
echo "1593600" > /sys/bus/cpu/devices/cpu1/cpufreq/scaling_max_freq
echo "307200" > /sys/bus/cpu/devices/cpu1/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu1/online
echo "1" > /sys/bus/cpu/devices/cpu1/online
chmod 444 /sys/bus/cpu/devices/cpu1/online
echo "40000 902400:55000 1286400:33000 1670400:32000" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/above_hispeed_delay
echo "0" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/align_windows
echo "0" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/boost
echo "" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/boostpulse
echo "0" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/boostpulse_duration
echo "1" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/enable_prediction
echo "1" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/fast_ramp_down
echo "300" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/go_hispeed_load
echo "307200" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/hispeed_freq
echo "1" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/ignore_hispeed_on_notif
echo "0" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/io_is_busy
echo "0" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/max_freq_hysteresis
echo "40000" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/min_sample_time
echo "0" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/powersave_bias
echo "1286400" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/screen_off_maxfreq
echo "35 748800:30 902400:32 1132800:35 1286400:37 1440000:65 1670400:72 1747200:85 1824000:99" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/target_loads
echo "40000" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/timer_rate
echo "-1" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/timer_slack
echo "1" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/use_migration_notif
echo "0" > /sys/bus/cpu/devices/cpu2/cpufreq/interactive/use_sched_load
chmod 777 /sys/bus/cpu/devices/cpu2/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu2/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu2/cpufreq/scaling_governor
echo "2150400" > /sys/bus/cpu/devices/cpu2/cpufreq/scaling_max_freq
echo "307200" > /sys/bus/cpu/devices/cpu2/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu2/online
echo "1" > /sys/bus/cpu/devices/cpu2/online
chmod 444 /sys/bus/cpu/devices/cpu2/online
echo "40000 902400:55000 1286400:33000 1670400:32000" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/above_hispeed_delay
echo "0" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/align_windows
echo "0" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/boost
echo "" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/boostpulse
echo "0" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/boostpulse_duration
echo "1" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/enable_prediction
echo "1" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/fast_ramp_down
echo "300" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/go_hispeed_load
echo "307200" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/hispeed_freq
echo "1" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/ignore_hispeed_on_notif
echo "0" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/io_is_busy
echo "0" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/max_freq_hysteresis
echo "40000" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/min_sample_time
echo "0" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/powersave_bias
echo "1286400" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/screen_off_maxfreq
echo "35 748800:30 902400:32 1132800:35 1286400:37 1440000:65 1670400:72 1747200:85 1824000:99" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/target_loads
echo "40000" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/timer_rate
echo "-1" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/timer_slack
echo "1" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/use_migration_notif
echo "0" > /sys/bus/cpu/devices/cpu3/cpufreq/interactive/use_sched_load
chmod 777 /sys/bus/cpu/devices/cpu3/cpufreq/scaling_governor
echo "interactive" > /sys/bus/cpu/devices/cpu3/cpufreq/scaling_governor
chmod 444 /sys/bus/cpu/devices/cpu3/cpufreq/scaling_governor
echo "2150400" > /sys/bus/cpu/devices/cpu3/cpufreq/scaling_max_freq
echo "307200" > /sys/bus/cpu/devices/cpu3/cpufreq/scaling_min_freq
chmod 644 /sys/bus/cpu/devices/cpu3/online
echo "1" > /sys/bus/cpu/devices/cpu3/online
chmod 444 /sys/bus/cpu/devices/cpu3/online
echo 624000000 > /sys/class/kgsl/kgsl-3d0/max_gpuclk
echo 180000000 > /sys/class/kgsl/kgsl-3d0/devfreq/min_freq
echo msm-adreno-tz > /sys/class/kgsl/kgsl-3d0/devfreq/governor

#switch
echo 0 > /sys/kernel/dyn_fsync/Dyn_fsync_active

#switch
if [ 1 == 1 ]
then
echo Y > /sys/module/sync/parameters/fsync_enabled
else
echo N > /sys/module/sync/parameters/fsync_enabled
fi

#spinner
echo cfq > /sys/block/mmcblk0/queue/scheduler
echo @toast=应用成功

#switch
echo 0 > /sys/block/mmcblk0/queue/iostats

#switch
echo 0 > /sys/block/mmcblk0/queue/nomerges

#switch
echo 0 > /sys/block/mmcblk0/queue/add_random

#switch
echo 0 > /sys/block/mmcblk0/queue/rotational

#seekbar
echo 1 > /sys/block/mmcblk0/queue/rq_affinity

#spinner
echo westwood > /proc/sys/net/ipv4/tcp_congestion_control
echo @toast=应用成功

#ufs

#spinner
echo cfq > /sys/block/sda/queue/scheduler
echo @toast=应用成功

#switch
echo 0 > /sys/block/sda/queue/iostats

#switch
echo 0 > /sys/block/sda/queue/nomerges

#switch
echo 0 > /sys/block/sda/queue/add_random

#switch
echo 0 > /sys/block/sda/queue/rotational

#seekbar
echo 1 > /sys/block/sda/queue/rq_affinity

#spinner
echo westwood > /proc/sys/net/ipv4/tcp_congestion_control
echo @toast=应用成功




echo 60 > /proc/sys/vm/swappiness
swapoff /dev/block/zram0
echo 535822336 > /sys/block/zram0/disksize
mkswap /dev/block/zram0
swapon /dev/block/zram0
swapoff /data/swap.La
rm -rf /data/swap.La


