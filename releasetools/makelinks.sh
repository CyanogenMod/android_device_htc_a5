#!/sbin/sh

set -e

modelid=`getprop ro.boot.mid`

case $modelid in
	0P9C51000|0P9C70000)	variant="dualsim" ;;
	0P9C30000)		variant="chl" ;;
	*)			variant="gsm" ;;
esac

basedir="/system/blobs/$variant/"
cd $basedir
chmod 755 bin/*
find . -type f | while read file; do ln -s $basedir$file /system/$file ; done
