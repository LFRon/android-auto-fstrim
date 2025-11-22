#!/system/bin/sh
#等待系统启动5秒完成繁忙的启动任务后统一进行TRIM优化
sleep 5
MODDIR=${0%/*}
MODULE_PROP="${MODDIR}/module.prop"

# 由于KernelSU自带了busybox,直接进行调用启动crond服务
busybox crond -b -S -c /data/adb/modules/android-fstrim/cron.d

## 进行缓存写回与内核碎片清理操作
sync
echo 3 > /proc/sys/vm/drop_caches
LD_LIBRARY_PATH="${MODDIR}" ${MODDIR}/fstrim -a -v
