SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=true
LATESTARTSERVICE=true


id="`grep_prop id $TMPDIR/module.prop`"
var_device="`getprop ro.product.device`"
var_version="`grep_prop ro.build.version.release`"
B="`grep_prop author $TMPDIR/module.prop`"
C="`grep_prop name $TMPDIR/module.prop`"
D="`grep_prop description $TMPDIR/module.prop`"

ui_print "***********************************"
ui_print " 安卓自动TRIM与内核碎片回收模块"
ui_print "***********************************"
ui_print "- 您的设备:$var_device"
ui_print "- 系统版本:$var_version"
ui_print "- 作者:LFRon"
sleep 2
ui_print "本模块使用busybox自带的crond能力,默认间隔1小时,在手机息屏时自动回收内存碎片并对磁盘进行TRIM优化"
#用于换行
ui_print "#######################"
ui_print "- 正在检测Busybox安装状态"
if busybox >/dev/null 2>&1;then
    ui_print "- 检测到busybox已安装"

else
    ui_print "⚠️警告:Busybox未找到,请安装busybox模块后再安装此模块!"

    ui_print "模块安装失败！"

    abort
fi

ui_print "- 正在安装模块"    
set_perm_recursive  $MODPATH  0  0  0644 0755

ui_print "- 模块安装完成,重启生效!"
ui_print "- 祝您玩机愉快~"