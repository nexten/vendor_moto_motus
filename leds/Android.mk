# Copyright 2006 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)

ifneq ($(TARGET_SIMULATOR),true)

include $(CLEAR_VARS)

LOCAL_MODULE := leds.motus

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := led_motus.c
LOCAL_SRC_FILES += led_stub.c
LOCAL_PRELINK_MODULE := false
LOCAL_CFLAGS    += -DCONFIG_LED_MOTUS
LOCAL_SHARED_LIBRARIES := liblog

include $(BUILD_SHARED_LIBRARY)

endif # !TARGET_SIMULATOR

