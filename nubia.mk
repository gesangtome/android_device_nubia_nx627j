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

LOCAL_NUBIA_DIR := device/nubia/nx627j
LOCAL_NUBIA_AUDIO_DIR := device/nubia/nx627j/audio
LOCAL_NUBIA_CONFIG_DIR := device/nubia/nx627j/configs
LOCAL_NUBIA_PERMISSION_DIR := device/nubia/nx627j/permissions

PRODUCT_ENFORCE_RRO_TARGETS := framework-res

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(LOCAL_NUBIA_DIR)/overlay-lineage/lineage-sdk

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_NUBIA_DIR)/overlay \
    $(LOCAL_NUBIA_DIR)/overlay-lineage

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

$(call inherit-product-if-exists, vendor/nubia/nx627j/nx627j-vendor.mk)

# Vendor properties
-include $(LOCAL_NUBIA_DIR)/vendor_props.mk

# AAPT
PRODUCT_AAPT_CONFIG := xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@5.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@5.0-impl \
    android.hardware.soundtrigger@2.2-impl \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default \
    audio.primary.msmnile \
    tinymix

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_platform_info.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_policy_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_volumes.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_AUDIO_DIR)/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/sound_trigger_mixer_paths_wcd9340_qrd.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_mixer_paths_wcd9340_qrd.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_platform_info.xml

# Audio (SoundFX)
PRODUCT_PACKAGES += \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener

# Audio (SoundFX)
PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_effects.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_policy_dts_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    $(LOCAL_NUBIA_AUDIO_DIR)/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    $(LOCAL_NUBIA_AUDIO_DIR)/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/mixer_paths_pahu.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_pahu.xml \
    $(LOCAL_NUBIA_AUDIO_DIR)/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml

S_AUDIOPOLICY_CONFIG := frameworks/av/services/audiopolicy/config

PRODUCT_COPY_FILES += \
    $(S_AUDIOPOLICY_CONFIG)/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(S_AUDIOPOLICY_CONFIG)/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(S_AUDIOPOLICY_CONFIG)/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(S_AUDIOPOLICY_CONFIG)/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Bluetooth
PRODUCT_PACKAGES += \
    libbthost_if \
    libbt-vendor

# Backward
PRODUCT_PACKAGES += \
    framework-atb-backward-compatibility

PRODUCT_BOOT_JARS += \
    framework-atb-backward-compatibility

# Camera
PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0 \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libxml2

ifeq ($(TARGET_USES_NUBIA_CAMERA),true)
PRODUCT_PACKAGES += \
    NB-Camera
else
PRODUCT_PACKAGES += \
    Snap
endif

# CNE
PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_PERMISSION_DIR)/vendor.qti.hardware.data.connection-V1.0-java.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ATT_profile1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ATT/ATT_profile1.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ATT_profile2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ATT/ATT_profile2.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ATT_profile3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ATT/ATT_profile3.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ATT_profile4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ATT/ATT_profile4.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ATT_profile5.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ATT/ATT_profile5.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ATT_profile6.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ATT/ATT_profile6.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile1.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile2.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile3.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile4.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile5.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile5.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile6.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile6.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile7.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile7.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile15.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile15.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile16.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile16.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile17.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile17.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile18.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile18.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile19.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile19.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile20.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile20.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile21.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile21.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/ROW_profile32.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/ROW_profile32.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/VZW_profile1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/VZW/VZW_profile1.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/VZW_profile2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/VZW/VZW_profile2.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/VZW_profile3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/VZW/VZW_profile3.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/VZW_profile4.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/VZW/VZW_profile4.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/VZW_profile5.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/VZW/VZW_profile5.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/cne/VZW_profile6.xml:$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/VZW/VZW_profile6.xml

# ConfigStore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service

# Charger
PRODUCT_PACKAGES += \
    charger \
    poweroffcharge

# Context Hub
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0-impl.generic \
    android.hardware.contexthub@1.0-service

# DPM
PRODUCT_BOOT_JARS += \
    tcmiface

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/dpm/dpm.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/dpm/dpm.conf

# DRM
PRODUCT_PACKAGES += \
    com.android.mediadrm.signer

PRODUCT_PACKAGES += \
    com.android.mediadrm.signer \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.clearkey

# DTS
PRODUCT_PACKAGES += \
    DTS_SOUND

# Fstab
PRODUCT_PACKAGES += \
    fstab.qcom

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

PRODUCT_BOOT_JARS += \
    ifaa_fingerprint

# Graphics
PRODUCT_PACKAGES += \
    libGLES_android \
    android.hardware.graphics.composer@2.3-service \
    android.hardware.graphics.mapper@2.0-impl-qti-display \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    vendor.qti.hardware.display.allocator-service \
    vendor.display.config@1.11 \
    hwcomposer.msmnile \
    memtrack.msmnile \
    gralloc.msmnile \
    libgui_vendor \
    libtinyxml \
    libvulkan

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    $(LOCAL_NUBIA_CONFIG_DIR)/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_NUBIA_CONFIG_DIR)/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_NUBIA_CONFIG_DIR)/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    $(LOCAL_NUBIA_CONFIG_DIR)/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    $(LOCAL_NUBIA_CONFIG_DIR)/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    $(LOCAL_NUBIA_CONFIG_DIR)/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# Health
PRODUCT_PACKAGES += \
    healthd \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.base@1.0_system \
    android.hidl.manager@1.0 \
    android.hidl.manager@1.0_system

#PRODUCT_BOOT_JARS += \
#    android.hidl.base-V1.0-java \
#    android.hidl.manager-V1.0-java

# IPA
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common_system

PRODUCT_BOOT_JARS += \
    ims-ext-common_system

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-V2.0-java \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    lights.msmnile \
    blank_screen

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.0-service-sdm

# keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_DIR)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# Media
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxG711Enc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_NUBIA_CONFIG_DIR)/media/system_properties.xml:$(TARGET_COPY_OUT_VENDOR)/etc/system_properties.xml

S_MEDIACODEC_CONFIG := frameworks/av/media/libstagefright/data

PRODUCT_COPY_FILES += \
    $(S_MEDIACODEC_CONFIG)/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(S_MEDIACODEC_CONFIG)/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(S_MEDIACODEC_CONFIG)/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(S_MEDIACODEC_CONFIG)/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Netutils
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Permissions
S_PERMISSION_CONFIG := frameworks/native/data/etc

PRODUCT_COPY_FILES += \
    $(S_PERMISSION_CONFIG)/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    $(S_PERMISSION_CONFIG)/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    $(S_PERMISSION_CONFIG)/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    $(S_PERMISSION_CONFIG)/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    $(S_PERMISSION_CONFIG)/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    $(S_PERMISSION_CONFIG)/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.verified_boot.xml \
    $(S_PERMISSION_CONFIG)/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    $(S_PERMISSION_CONFIG)/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_PERMISSION_DIR)/defaultPermission.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/defaultPermission.xml \
    $(LOCAL_NUBIA_PERMISSION_DIR)/privapp-permissions-nubia.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-nubia.xml \
    $(LOCAL_NUBIA_PERMISSION_DIR)/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service-qti

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/power/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# Radio
PRODUCT_PACKAGES += \
    libjson \
    librmnetctl

PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl

# Ramdisk
PRODUCT_PACKAGES += \
    init.qcom.rc \
    init.recovery.qcom.rc \
    init.target.rc \
    ueventd.qcom.rc \
    init.extension.rc \
    init.camera.rc \
    init.dmapp.rc \
    init.fingerprint.rc \
    init.haptic.rc \
    init.led.rc \
    init.light.rc \
    init.platfrom.rc \
    init.sensors.rc \
    init.touch.rc \
    init.flowertome.rc

# Shell
PRODUCT_PACKAGES += \
    init.class_late.sh \
    init.class_main.sh \
    init.crda.sh \
    init.mdm.sh \
    init.qcom.class_core.sh \
    init.qcom.crashdata.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.sensors.sh \
    init.qcom.sh \
    init.qti.can.sh \
    init.qti.qseecomd.sh

# RenderScript
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_DIR)/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    $(LOCAL_NUBIA_DIR)/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += device/nubia/nx627j

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sec_config

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/descriptor.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protodescriptor.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/nanopb.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protonanopb.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_accel_cal.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_accel_cal.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_accel.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_accel.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_ambient_light.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_ambient_light.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_ambient_temperature.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_ambient_temperature.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_amd.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_amd.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_aont.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_aont.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_async_com_port.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_async_com_port.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_basic_gestures.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_basic_gestures.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_bring_to_ear.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_bring_to_ear.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_cal.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_cal.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_ccd_ttw.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_ccd_ttw.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_ccd_walk.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_ccd_walk.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_client.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_client.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_cmc.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_cmc.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_cmd.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_cmd.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_dae.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_dae.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_data_acquisition_engine.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_data_acquisition_engine.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_da_test.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_da_test.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_device_mode.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_device_mode.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_device_orient.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_device_orient.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_diag.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_diag.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_diag_sensor.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_diag_sensor.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_distance_bound.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_distance_bound.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_dpc.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_dpc.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_ext_svc.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_ext_svc.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_facing.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_facing.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_fmv.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_fmv.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_fw.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_fw.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_game_rv.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_game_rv.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_geomag_rv.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_geomag_rv.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_gravity.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_gravity.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_gyro_cal.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_gyro_cal.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_gyro.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_gyro.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_gyro_rot_matrix.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_gyro_rot_matrix.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_hall.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_hall.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_heart_beat.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_heart_beat.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_heart_rate.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_heart_rate.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_humidity.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_humidity.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_interrupt.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_interrupt.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_mag_cal.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_mag_cal.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_mag.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_mag.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_mcmd.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_mcmd.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_motion_detect.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_motion_detect.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_multishake.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_multishake.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_oem1.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_oem1.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_offbody_detect.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_offbody_detect.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_pedometer.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_pedometer.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_pedometer_wrist.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_pedometer_wrist.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_physical_sensor_test.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_physical_sensor_test.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_pose_6dof.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_pose_6dof.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_ppg.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_ppg.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_pressure.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_pressure.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_proximity.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_proximity.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_psmd.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_psmd.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_registry.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_registry.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_remote_proc_state.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_remote_proc_state.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_resampler.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_resampler.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_rgb.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_rgb.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_rmd.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_rmd.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_rotv.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_rotv.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_sar.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_sar.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_sensor_temperature.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_sensor_temperature.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_sig_motion.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_sig_motion.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_signal_sensor.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_signal_sensor.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_sim_legacy.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_sim_legacy.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_sim.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_sim.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_std_event_gated_sensor.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_std_event_gated_sensor.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_std.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_std.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_std_sensor.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_std_sensor.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_std_type.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_std_type.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_suid.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_suid.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_thermopile.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_thermopile.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_threshold.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_threshold.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_tilt.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_tilt.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_tilt_to_wake.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_tilt_to_wake.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_timer.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_timer.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_ultra_violet.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_ultra_violet.proto \
    $(LOCAL_NUBIA_CONFIG_DIR)/sensors/sns_wrist_tilt_gesture.proto:$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/protosns_wrist_tilt_gesture.proto

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service \
    thermal.msmnile

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# USB
PRODUCT_PACKAGES += \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    init.msm.usb.configfs.rc

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JAR += telephony-ext

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/telephony/config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/telephony/config.xml

# USB default HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

PRODUCT_COPY_FILES += \
    $(S_PERMISSION_CONFIG)/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml

# VNDK
PRODUCT_PACKAGES += \
    vndk_package

# VNDK-SP
PRODUCT_PACKAGES += \
    vndk-sp

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Whitelist
PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_CONFIG_DIR)/whitelist/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \
    $(LOCAL_NUBIA_CONFIG_DIR)/whitelist/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

# VR
PRODUCT_PACKAGES += \
    android.hardware.vr@1.0-impl \
    android.hardware.vr@1.0-service \
    vr.msmnile

# WLAN
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    vendor.qti.hardware.wifi@1.0 \
    vendor.qti.hardware.wifi.hostapd@1.0 \
    vendor.qti.hardware.wifi.supplicant@2.0

PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    libcld80211 \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_cli \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_NUBIA_DIR)/wifi/hostapd.accept:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.accept \
    $(LOCAL_NUBIA_DIR)/wifi/hostapd.conf:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd_default.conf \
    $(LOCAL_NUBIA_DIR)/wifi/hostapd.deny:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.deny \
    $(LOCAL_NUBIA_DIR)/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_NUBIA_DIR)/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_NUBIA_DIR)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# WiFi Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libnl \
    libqdMetaData \
    libqdMetaData.system

PRODUCT_BOOT_JARS += \
    WfdCommon
