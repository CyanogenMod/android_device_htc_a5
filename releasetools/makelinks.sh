#!/sbin/sh

set -e

modelid=`getprop ro.boot.mid`

case $modelid in
	0P9C30000)			variant="chl" ;;
	0P9C50000|0P9C51000|0P9C70000)	variant="dualsim" ;;
	*)				variant="gsm" ;;
esac

if [ $variant == "gsm" ]; then
	# remove prebuilt ril blobs
	rm -rf /system/blobs/gsm/lib
	rm -f /system/blobs/gsm/bin/rild
fi

if [ $variant == "dualsim" ]; then
	# dualsim variant uses prebuilt ril blobs
	rm -f /system/bin/rild
	rm -f /system/lib/libril.so
	NFCFILES="app/NfcNci.apk etc/permissions/android.hardware.nfc.xml etc/permissions/android.hardware.nfc.hce.xml etc/permissions/com.android.nfc_extras.xml etc/permissions/com.cyanogenmod.nfc.enhanced.xml etc/nfcee_access.xml etc/libnfc-nxp.conf etc/libnfc-brcm.conf lib/libnfc-nci.so lib/hw/nfc_nci.msm8226.so lib/libnfc_nci_jni.so lib/libnfc_ndef.so framework/com.android.nfc_extras.jar priv-app/Tag.apk vendor/firmware/libpn547_fw.so"
	for i in $NFCFILES; do
		rm -f /system/$i
	done
	variant="gsm"
fi

basedir="/system/blobs/$variant/"
cd $basedir
chmod 755 bin/*
find . -type f | while read file; do ln -s $basedir$file /system/$file ; done
