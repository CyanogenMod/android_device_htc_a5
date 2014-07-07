$(call inherit-product, device/htc/a5dwg/full_a5dwg.mk)

$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_RELEASE_NAME := a5dwg

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/a5dwg/device.mk)

# Device naming
PRODUCT_DEVICE := a5dwg
PRODUCT_NAME := cm_a5dwg
PRODUCT_BRAND := htc
PRODUCT_MODEL := Desire 816 Dual Sim
PRODUCT_MANUFACTURER := HTC

BUILD_FINGERPRINT=htc/htc_asia_india/a5dwg:4.4.4/KTU84P/901c148c5b:eng/test-keys
