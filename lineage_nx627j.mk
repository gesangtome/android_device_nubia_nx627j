# Copyright (C) 2018-2019 The LineageOS Project
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

# Release name
PRODUCT_RELEASE_NAME := nubia NX627J

# Inherit from those products
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Inherit from natrium device
$(call inherit-product, device/nubia/nx627j/nubia.mk)

# Inherit some common lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := nx627j
PRODUCT_NAME := lineage_nx627j
PRODUCT_BRAND := nubia
PRODUCT_MODEL := nx627j
PRODUCT_MANUFACTURER := nubia

BUILD_FINGERPRINT := "nubia/NX627J/NX627J:9/PKQ1.190714.001/eng.nubia.20191016.215019:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="NX627J-user 9 PKQ1.190714.001 eng.nubia.20191016.215019 release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-nubia
