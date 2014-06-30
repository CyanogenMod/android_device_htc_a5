$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/htc/htc_a5dwg/device.mk)

LOCAL_PATH := device/htc/htc_a5dwg

# htc_a5dwg specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

$(call inherit-product, device/htc/htc_a5dwg/keylayout/keylayout.mk)
$(call inherit-product, vendor/htc/htc_a5dwg/proprietary/htc_a5dwg-vendor.mk)
