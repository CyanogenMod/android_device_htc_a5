#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

#-include device/htc/htc_a5dwg/BoardConfig.mk

USE_CAMERA_STUB := true

LOCAL_PATH := device/htc/htc_a5dwg

# inherit from the proprietary version
-include vendor/htc/htc_a5dwg/proprietary/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8226
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := htc_a5dwg

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 ehci-hcd.park=3
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02008000 --dt device/htc/htc_a5dwg/prebuilt/dt.img

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x01000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0xa0000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x08000000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := device/htc/htc_a5dwg/prebuilt/kernel
#TARGET_KERNEL_SOURCE := kernel/htc/htc_a5dwg
#TARGET_KERNEL_CONFIG := a5ul_defconfig

BOARD_HAS_NO_SELECT_BUTTON := true

# QCOM BSP
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP

# Audio
AUDIO_FEATURE_DISABLED_FM :=
AUDIO_FEATURE_DISABLED_SSR := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_DISABLED_ANC_HEADSET := true

# Graphics
BOARD_EGL_CFG := device/htc/htc_a5dwg/config/egl.cfg
TARGET_DISPLAY_USE_RETIRE_FENCE :=
TARGET_QCOM_DISPLAY_VARIANT := caf-new

# Enables Adreno RS driver
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_QCOM_MEDIA_VARIANT := caf-new

# Use qcom power hal
TARGET_POWERHAL_VARIANT := qcom

#TARGET_HW_DISK_ENCRYPTION := true

TARGET_SPECIFIC_HEADER_PATH := device/htc/htc_a5dwg/include

# Recovery
TARGET_RECOVERY_FSTAB := device/htc/htc_a5dwg/rootdir/etc/fstab.qcom
DEVICE_RESOLUTION := 720x1280
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "internal_sd"
TW_EXTERNAL_STORAGE_PATH := "/sdcard2"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TARGET_OTA_ASSERT_DEVICE := htc_a5dwg
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888″
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
TARGET_BRIGHTNESS_PATH := /sys/devices/fd900000.qcom,mdss_mdp/qcom,mdss_fb_primary.156/leds/lcd-backlight/brightness
BOARD_USE_FB2PNG := true
BOARD_USE_AROMA_FILE_MANAGER := true
