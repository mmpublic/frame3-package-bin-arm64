#!/system/bin/sh

# remount /system rw
mount  -o remount,rw /system
mkdir -p /system/xbin/mm/
# copy version
cp -R ./mm/* /system/xbin/mm/
# 改变权限
chmod 755 /system/xbin/mm/*.
# 提升mmod权限
chmod 4755 /system/xbin/mm/mmod
# 覆盖版本信息
cp ./version /system/xbin/mm/

# remount /system ro
mount  -o remount,ro /system

