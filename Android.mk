
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_LDLIBS += -lrt -ldl -lpthread

LOCAL_SRC_FILES := \
	GoHttp.c

LOCAL_C_INCLUDES += external/openssl/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../include/private external/hiredis external/hiredis/adapters external/chromium/third_party/libevent
LOCAL_MODULE := gohttp
LOCAL_STATIC_LIBRARIES := libzipfile libunz libcrypto_static libevent libhiredis
LOCAL_SHARED_LIBRARIES := libdl

include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)
LOCAL_MODULE := httpd.conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := mime.types
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/etc
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
