# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true
TARGET_USES_64_BIT_BINDER := true

# AVB
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := nubia

# Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_FBE := true

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

# Kernel 
#TARGET_KERNEL_SOURCE := kernel/nubia/sm8150
#TARGET_KERNEL_CONFIG := sm8150-perf_defconfig
#TARGET_KERNEL_CLANG_COMPILE := true
#TARGET_KERNEL_CLANG_PATH := prebuilts/clang/host/linux-x86/clang-4691093
TARGET_PREBUILT_KERNEL :=  device/nubia/nx627j/kernel
BOARD_PREBUILT_DTBOIMAGE := device/nubia/nx627j/kernel-dtbo

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100

BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
NEED_KERNEL_MODULE_SYSTEM := true

BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200n8 \
    earlycon=msm_geni_serial,0xa90000 \
    androidboot.hardware=qcom androidboot.console=ttyMSM0 \
    androidboot.memcg=1 lpm_levels.sleep_disabled=1 \
    video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 \
    service_locator.enable=1 swiotlb=2048 \
    firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7 \
    androidboot.usbcontroller=a600000.dwc3

ifneq ($(TARGET_BUILD_VARIANT),user)
BOARD_KERNEL_CMDLINE += \
    androidboot.selinux=permissive
endif

BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET) \
    --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

# OTA Package
TARGET_OTA_ASSERT_DEVICE := nx627j,NX627J

# Platform
TARGET_BOARD_PLATFORM := msmnile
TARGET_BOARD_PLATFORM_GPU := qcom-adreno640

# Partitions
TARGET_USES_UEFI := true
TARGET_USES_MKE2FS := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5368709120
BOARD_CACHE_PARTITION_SIZE := 242221056
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USERDATAIMAGE_PARTITION_SIZE := 119531372544
BOARD_VENDORIMAGE_PARTITION_SIZE := 1006632960
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_ROOT_EXTRA_FOLDERS := \
    bluetooth \
    dsp \
    firmware \
    persist

# =======================
#       TWRP FLAGS
# =======================

# Whether to use the vertical theme?
# Default: vertical theme
TW_THEME := portrait_hdpi

# Whether to use extended languages?
# Default: Chinese - The People's Republic of China
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN

# Whether to use the toolbox?
# Default: toolbox
TW_USE_TOOLBOX := true

# Whether to use the ntfs filesystem module?
# Default: ntfs-3g
TW_INCLUDE_NTFS_3G := true

# Whether to use input blacklist?
# Default: hbtp_vm
TW_INPUT_BLACKLIST := "hbtp_vm"

# Whether to set the panel brightness?
# Default: 160
# Max: 255
TW_DEFAULT_BRIGHTNESS := 160
TW_MAX_BRIGHTNESS := 255

# Whether to set the panel brightness path?
# Default: /sys/class/backlight/panel0-backlight/brightness
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"

# Whether to customize the lun file path?
# Default: /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file"

# Whether to exclude generic init.{variants}.rc?
# Default: true
TW_EXCLUDE_DEFAULT_USB_INIT := true

# Whether to add recovery device module?
# Default: android.hardware.boot
TARGET_RECOVERY_DEVICE_MODULES += android.hardware.boot@1.0

# Whether to customize the display pixel format?
# Default: BGRA_8888
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

# Whether to display a blank screen when bootimg recovery?
# Default: false
TW_SCREEN_BLANK_ON_BOOT := false

# Whether to prompt 'install twrp app' when restarting
# Default: false
TW_EXCLUDE_TWRPAPP := true

# Whether the device has a real sdcard?
# Default: false
BOARD_HAS_NO_REAL_SDCARD := true

# Whether the SD card of the device is in userdata?
# Default: true
RECOVERY_SDCARD_ON_DATA := true

# Whether the twrp need logcat binary?
# Default: true
TWRP_INCLUDE_LOGCAT := true

# Whether the twrp need logd binary?
# Default: false
TARGET_USES_LOGD := true

# Whether the board has an large file system?
# Default: true
BOARD_HAS_LARGE_FILESYSTEM := true

# Whether the twrp need qcom RTC fix?
# Default: true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Whether the twrp have legacy props?
# Default: false
TW_NO_LEGACY_PROPS := true

# SHRP-specific lines
SHRP_PATH := device/nubia/nx627j
SHRP_MAINTAINER := gesangtome
SHRP_DEVICE_CODE := NX627J
SHRP_EDL_MODE := 1
SHRP_EXTERNAL := /external_sd
SHRP_INTERNAL := /sdcard
SHRP_OTG := /usb_otg
SHRP_FLASH := 1
SHRP_CUSTOM_FLASHLIGHT := true
SHRP_FONP_1 := /sys/class/leds/led:torch_0/brightness
SHRP_FONP_2 := /sys/class/leds/led:torch_1/brightness
SHRP_FONP_3 := /sys/class/leds/led:torch_2/brightness
SHRP_FLASH_MAX_BRIGHTNESS := 200
SHRP_REC := /dev/block/bootdevice/by-name/recovery
SHRP_REC_TYPE := Treble
SHRP_DEVICE_TYPE := A_Only
SHRP_STATUSBAR_RIGHT_PADDING := 40
SHRP_STATUSBAR_LEFT_PADDING := 40
SHRP_EXPRESS := true

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31

# Security patch level
VENDOR_SECURITY_PATCH := 2099-12-31

# SELINUX
PRODUCT_SEPOLICY_SPLIT := false

# inherit from the proprietary version
-include vendor/nubia/nx627j/BoardConfigVendor.mk
