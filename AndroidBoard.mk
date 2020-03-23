LOCAL_PATH := $(call my-dir)

#----------------------------------
# Install firmware image
#----------------------------------
ifeq ($(ADD_RADIO_FILES), true)
INSTALLED_RADIOIMAGE_TARGET += \
    $(LOCAL_PATH)/images/abl.elf \
    $(LOCAL_PATH)/images/tz.mbn \
    $(LOCAL_PATH)/images/xbl_config.elf \
    $(LOCAL_PATH)/images/xbl.elf \
    $(LOCAL_PATH)/images/hyp.mbn \
    $(LOCAL_PATH)/images/NON-HLOS.bin \
    $(LOCAL_PATH)/images/cmnlib.mbn \
    $(LOCAL_PATH)/images/cmnlib64.mbn \
    $(LOCAL_PATH)/images/dspso.bin \
    $(LOCAL_PATH)/images/qupv3fw.elf \
    $(LOCAL_PATH)/images/km4.mbn \
    $(LOCAL_PATH)/images/BTFM.bin \
    $(LOCAL_PATH)/images/aop.mbn \
    $(LOCAL_PATH)/images/abl.elf \
    $(LOCAL_PATH)/images/devcfg.mbn \
    $(LOCAL_PATH)/images/splash.img \
    $(LOCAL_PATH)/images/uefi_sec.mbn \
    $(LOCAL_PATH)/images/parameter.img \
    $(LOCAL_PATH)/images/storsec.mbn \
    $(LOCAL_PATH)/images/imagefv.elf
endif
