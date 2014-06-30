# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/htc/htc_a5dwg/device_htc_a5dwg.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := htc_a5dwg
PRODUCT_NAME := full_htc_a5dwg
PRODUCT_BRAND := htc
PRODUCT_MODEL := htc_a5dwg
PRODUCT_MANUFACTURER := htc

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/htc_a5dwg/proprietary/htc_a5dwg-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/htc_a5dwg/overlay

LOCAL_PATH := device/htc/htc_a5dwg

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_htc_a5dwg
PRODUCT_DEVICE := htc_a5dwg
