#!/system/bin/sh
MODDIR=${0%/*}
MODULE_PROP="${MODDIR}/module.prop"

##进行缓存写回与内核碎片清理操作
sync
##设置回收所有内核碎片
echo 3 > /proc/sys/vm/drop_caches
##对硬盘进行TRIM优化
LD_LIBRARY_PATH="${MODDIR}" ${MODDIR}/fstrim -a -v
