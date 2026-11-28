#!/system/bin/sh
# MediaTek MT6877 Wi-Fi service script for AERA Recovery

# Load Wi-Fi kernel modules if available as .ko
if [ -f /vendor/lib/modules/conninfra.ko ]; then
    insmod /vendor/lib/modules/conninfra.ko
fi
if [ -f /vendor/lib/modules/wmt_drv.ko ]; then
    insmod /vendor/lib/modules/wmt_drv.ko
fi
if [ -f /vendor/lib/modules/wlan_drv_gen4m.ko ]; then
    insmod /vendor/lib/modules/wlan_drv_gen4m.ko
fi

# Ensure firmware symlink exists if needed
if [ ! -d /etc/firmware ] && [ -d /vendor/firmware ]; then
    mkdir -p /etc
    ln -s /vendor/firmware /etc/firmware
fi

# Start WMT combo loader and launcher
setprop ctl.start wmt_loader
sleep 1
setprop ctl.start wmt_launcher

# Trigger Wi-Fi interface power
if [ -e /dev/wmtWifi ]; then
    echo 1 > /dev/wmtWifi
fi
setprop wmt.wifi.power 1
sleep 1

# Start wpa_supplicant daemon
if [ -x /system/bin/wpa_supplicant ]; then
    mkdir -p /data/vendor/wifi/wpa/sockets
    chmod 0770 /data/vendor/wifi/wpa/sockets
    chown wifi wifi /data/vendor/wifi/wpa/sockets
    /system/bin/wpa_supplicant -Dnl80211 -iwlan0 -c/system/etc/wifi/wpa_supplicant.conf -B
fi
