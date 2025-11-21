## 安卓自动TRIM+内存碎片整理+内存写回+内存碎片整理KernelSU模块

### 模块用途: 一加Ace3的潮汐引擎居然被砍了, 既然如此, 那就直接调用Linux内核节点去手动实现一个!

### Magisk用户注意: 需要让busybox二进制文件全局可见, 建议直接安装适配Magisk的busybox模块

模块运行原理: 通过KernelSU/Apatch自带的busybox里的cron.d, 实现间隔1小时执行优化脚本, 而优化脚本auto_trim.sh加入了亮屏/灭屏检测, 只有间隔1小时且手机灭屏的情况下, 才会触发脚本进行内存写回+内存碎片整理+自动TRIM

支持机型: 本模块已在小米6(LineageOS 23.0)与一加Ace3(ColorOS/LineageOS 23.0)上通过测试, 其他机子未经测试, 欢迎提交机型运行信息!