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
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a75

TARGET_USES_64_BIT_BINDER := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := "nubia smartphone"
TARGET_BOARD_PLATFORM := msmnile

# Kernel 
TARGET_KERNEL_SOURCE := kernel/nubia/sm8150
TARGET_KERNEL_CONFIG := sm8150-perf_defconfig

ifneq ($(TARGET_BUILD_VARIANT),eng)
    TARGET_KERNEL_CLANG_COMPILE := true
else
    TARGET_KERNEL_CLANG_COMPILE := false
endif

BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100

BOARD_MKBOOTIMG_ARGS := \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --tags_offset $(BOARD_TAGS_OFFSET)

BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
NEED_KERNEL_MODULE_SYSTEM := true

BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xa90000 \
    androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 \
    msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 \
    firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7 \
    androidboot.usbcontroller=a600000.dwc3

ifeq ($(TARGET_BUILD_VARIANT),user)
  BOARD_KERNEL_CMDLINE += buildvariant=user
else
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
  BOARD_KERNEL_CMDLINE += buildvariant=userdebug
else
ifeq ($(TARGET_BUILD_VARIANT),eng)
  BOARD_KERNEL_CMDLINE += buildvariant=eng
endif
endif
endif

# Partitions
TARGET_USES_UEFI := true
TARGET_USES_MKE2FS := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 5153960755
BOARD_CACHE_PARTITION_SIZE := 243269632
BOARD_USERDATAIMAGE_PARTITION_SIZE := 119185342464
BOARD_VENDORIMAGE_PARTITION_SIZE := 975175680
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_FLASH_BLOCK_SIZE := 262144

# inherit from the proprietary version
-include vendor/nubia/nx627j/BoardConfigVendor.mk
