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

PRODUCT_ENFORCE_RRO_TARGETS := framework-res

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	device/nubia/nx627j/overlay \
	device/nubia/nx627j/overlay-pa

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

$(call inherit-product-if-exists, vendor/nubia/nx627j/nx627j-vendor.mk)

# Vendor properties
-include device/nubia/nx627j/vendor_props.mk

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

PRODUCT_PACKAGES += \
    android.hardware.audio.common-util \
    android.hardware.audio.common@2.0-util \
    android.hardware.audio.common@4.0-util \
    android.hardware.audio.common@5.0-util

PRODUCT_COPY_FILES += \
    device/nubia/nx627j/permissions/audiosphere.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/audiosphere.xml \
    device/nubia/nx627j/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_platform_info.xml \
    device/nubia/nx627j/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_volumes.xml \
    device/nubia/nx627j/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/default_volume_tables.xml

PRODUCT_COPY_FILES += \
    device/nubia/nx627j/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_mixer_paths.xml \
    device/nubia/nx627j/audio/sound_trigger_mixer_paths_wcd9340.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_mixer_paths_wcd9340.xml \
    device/nubia/nx627j/audio/sound_trigger_mixer_paths_wcd9340_qrd.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_mixer_paths_wcd9340_qrd.xml \
    device/nubia/nx627j/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sound_trigger_platform_info.xml

# Audio (SoundFX)
PRODUCT_PACKAGES += \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libvolumelistener

# Audio (SoundFX)
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/audio/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    device/nubia/nx627j/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    device/nubia/nx627j/audio/audio_effects.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_effects.xml \
    device/nubia/nx627j/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    device/nubia/nx627j/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/nubia/nx627j/audio/audio_policy_dts_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    device/nubia/nx627j/audio/audio_tuning_mixer_tavil.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer_tavil.txt \
    device/nubia/nx627j/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
    device/nubia/nx627j/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
    device/nubia/nx627j/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
    device/nubia/nx627j/audio/mixer_paths_pahu.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_pahu.xml \
    device/nubia/nx627j/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml

S_AUDIOPOLICY_CONFIG := frameworks/av/services/audiopolicy/config

PRODUCT_COPY_FILES += \
    $(S_AUDIOPOLICY_CONFIG)/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(S_AUDIOPOLICY_CONFIG)/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(S_AUDIOPOLICY_CONFIG)/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# AID/fs configs
PRODUCT_PACKAGES += \
    fs_config_files

# ANT+
PRODUCT_PACKAGES += \
    AntHalService

# Bluetooth
PRODUCT_PACKAGES += \
    libbt-vendor

# Bluetooth (Qualcomm APTX)
PRODUCT_PACKAGES += \
    aptxals

# ConfigStore
PRODUCT_PACKAGES += \
    android.hardware.configstore@1.1-service

# Context Hub
PRODUCT_PACKAGES += \
    android.hardware.contexthub@1.0-impl.generic \
    android.hardware.contexthub@1.0-service

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

# Charger
PRODUCT_PACKAGES += \
    charger \
    poweroffcharge

# CNE
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/permissions/cneapiclient.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/cneapiclient.xml \
    device/nubia/nx627j/permissions/com.quicinc.cne.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.quicinc.cne.xml \
    device/nubia/nx627j/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml

$(foreach f,$(wildcard device/nubia/nx627j/configs/cne/ATT_*.xml),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ATT/$(notdir $f)))

$(foreach f,$(wildcard device/nubia/nx627j/configs/cne/ROW_*.xml),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/ROW/$(notdir $f)))

$(foreach f,$(wildcard device/nubia/nx627j/configs/cne/VZW_*.xml),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/cne/wqeclient/VZW/$(notdir $f)))

# COLOR SERVICE
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/permissions/com.qti.snapdragon.sdk.display.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.qti.snapdragon.sdk.display.xml

# DATA
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml

# DPM
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/configs/dpm.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/dpm/dpm.conf \
    device/nubia/nx627j/permissions/dpmapi.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/dpmapi.xml \
    device/nubia/nx627j/permissions/com.qti.dpmframework.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.qti.dpmframework.xml

# DRM
PRODUCT_PACKAGES += \
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
    hwcomposer.msmnile \
    memtrack.msmnile \
    gralloc.msmnile \
    libgui_vendor \
    libtinyxml \
    libvulkan

PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.allocator-service \
    vendor.display.config@1.16

# GPS
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/configs/gps/apdr.conf:$(TARGET_COPY_OUT_VENDOR)/etc/apdr.conf \
    device/nubia/nx627j/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    device/nubia/nx627j/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    device/nubia/nx627j/configs/gps/izat.conf:$(TARGET_COPY_OUT_VENDOR)/etc/izat.conf \
    device/nubia/nx627j/configs/gps/lowi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/lowi.conf \
    device/nubia/nx627j/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf \
    device/nubia/nx627j/configs/gps/xtwifi.conf:$(TARGET_COPY_OUT_VENDOR)/etc/xtwifi.conf

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.0-impl \
    android.hardware.health@2.0-service

# IPA
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common_system

PRODUCT_BOOT_JARS += \
    ims-ext-common_system

# IRQ
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-V2.0-java \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# keylayout
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Media
PRODUCT_PACKAGES += \
    com.android.mediadrm.signer

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
    device/nubia/nx627j/configs/media_codecs.xml:vendor/etc/media_codecs.xml \
    device/nubia/nx627j/configs/media_codecs_performance.xml:vendor/etc/media_codecs_performance.xml \
    device/nubia/nx627j/configs/media_codecs_vendor.xml:vendor/etc/media_codecs_vendor.xml \
    device/nubia/nx627j/configs/media_codecs_vendor_audio.xml:vendor/etc/media_codecs_vendor_audio.xml \
    device/nubia/nx627j/configs/media_profiles.xml:vendor/etc/media_profiles.xml \
    device/nubia/nx627j/configs/media_profiles_V1_0.xml:vendor/etc/media_profiles_V1_0.xml \
    device/nubia/nx627j/configs/media_profiles_vendor.xml:vendor/etc/media_profiles_vendor.xml \
    device/nubia/nx627j/configs/system_properties.xml:vendor/etc/system_properties.xml

S_MEDIACODEC_CONFIG := frameworks/av/media/libstagefright/data

PRODUCT_COPY_FILES += \
    $(S_MEDIACODEC_CONFIG)/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(S_MEDIACODEC_CONFIG)/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    $(S_MEDIACODEC_CONFIG)/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(S_MEDIACODEC_CONFIG)/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Netutils
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# Nubia
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/permissions/privapp-permissions-nubia.xml:system/etc/permissions/privapp-permissions-nubia.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.rtt.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.rtt.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    device/nubia/nx627j/permissions/defaultPermission.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/defaultPermission.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.software.freeform_window_management.xml \

# Power
PRODUCT_PACKAGES += \
    android.hardware.power@1.2-service-qti

PRODUCT_COPY_FILES += \
    device/nubia/nx627j/configs/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# QTI
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/permissions/privapp-permissions-qti.xml:system/etc/permissions/privapp-permissions-qti.xml \
    

# QMI
PRODUCT_COPY_FILES += \
    device/nubia/nx627j/permissions/qti_libpermissions.xml:system/etc/permissions/qti_libpermissions.xml \
    device/nubia/nx627j/permissions/qti_permissions.xml:system/etc/permissions/qti_permissions.xml

# Radio
PRODUCT_PACKAGES += \
    libjson \
    librmnetctl

PRODUCT_PACKAGES += \
    android.hardware.broadcastradio@1.0-impl

PRODUCT_COPY_FILES += \
    device/nubia/nx627j/permissions/embms.xml:system/etc/permissions/embms.xml \
    device/nubia/nx627j/permissions/qti_permissions.xml:system/etc/permissions/qti_permissions.xml \
    device/nubia/nx627j/permissions/qti_telephony_common.xml:system/etc/permissions/qti_telephony_common.xml

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
    device/nubia/nx627j/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy \
    device/nubia/nx627j/seccomp/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += device/nubia/nx627j

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    device/nubia/nx627j/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf \
    device/nubia/nx627j/configs/sensors/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

$(foreach f,$(wildcard device/nubia/nx627j/configs/sensors/system/*.*),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/sensors/proto/$(notdir $f)))

$(foreach f,$(wildcard device/nubia/nx627j/configs/sensors/vendor/config/*.*),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_VENDOR)/etc/sensors/config/$(notdir $f)))

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@1.0-impl \
    android.hardware.thermal@1.0-service \
    thermal.msmnile

# TextClassifier
PRODUCT_PACKAGES += \
    textclassifier.bundle1


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
    device/nubia/nx627j/configs/telephony.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/telephony/config.xml

# USB default HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

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
    device/nubia/nx627j/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt \
    device/nubia/nx627j/configs/qti_whitelist.xml:system/etc/sysconfig/qti_whitelist.xml

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
    device/nubia/nx627j/wifi/hostapd.accept:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.accept \
    device/nubia/nx627j/wifi/hostapd.conf:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd_default.conf \
    device/nubia/nx627j/wifi/hostapd.deny:$(TARGET_COPY_OUT_VENDOR)/etc/hostapd/hostapd.deny \
    device/nubia/nx627j/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    device/nubia/nx627j/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    device/nubia/nx627j/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# WiFi Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libnl \
    libqdMetaData \
    libqdMetaData.system

PRODUCT_BOOT_JARS += \
    WfdCommon
