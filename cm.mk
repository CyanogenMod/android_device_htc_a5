# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Release name
PRODUCT_RELEASE_NAME := HTC Desire 816 Dual Sim
PRODUCT_NAME := cm_htc_a5dwg

$(call inherit-product, device/htc/htc_a5dwg/full_htc_a5dwg.mk)

BUILD_FINGERPRINT=htc/htc_asia_india/htc_a5dwg:4.4.4/KTU84P/901c148c5b:eng/test-keys
