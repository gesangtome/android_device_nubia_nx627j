# Created by 弱弱的胖橘猫丷

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := NB-Camera
LOCAL_SRC_FILES    := $(LOCAL_MODULE).apk
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_MODULE_PATH  := $(TARGET_OUT__APPS)
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
# LOCAL_REQUIRED_MODULES := 
include $(BUILD_PREBUILT)