#!/sbin/sh

set -e

modelid=`getprop ro.boot.mid`

case $modelid in
	0P9C50000|0P9C51000)	variant="dwg" ;;
	0P9C70000)		variant="dug" ;;
	0P9C30000)		variant="chl" ;;
	*)			variant="gsm" ;;
esac

if [ $variant == "dwg" ] || [ $variant == "dug" ]; then
	rm -f /system/bin/rild
	rm -f /system/lib/libril.so
	find /system/etc/permissions -name "*nfc*" -exec rm -f {} \;
fi

basedir="/system/blobs/$variant/"
cd $basedir
chmod 755 bin/*
find . -type f | while read file; do ln -s $basedir$file /system/$file ; done
