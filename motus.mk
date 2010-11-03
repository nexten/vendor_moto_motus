#
# Copyright (C) 2008 The Android Open Source Project
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
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/motorola/motus/overlay

PRODUCT_PACKAGES += \
    VoiceDialer \
    sensors.motus \
    leds.motus \
    lights.motus

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    wifi.interface=eth0

# Time between scans in seconds. Keep it high to minimize battery drain.
# This only affects the case in which there are remembered access points,
# but none are in range.
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=45

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Default network type
# 1 => GSM Only.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=1
    
# Disable JIT by default
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:fast

# enable insecure AGPS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.def.agps.mode=2

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=65536

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/motorola/motus/media_profiles.xml:/system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
    device/motorola/motus/dhd.ko:system/lib/modules/dhd.ko

# The kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/motorola/motus/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/motorola/motus/vold.fstab:system/etc/vold.fstab \
    device/motorola/motus/gps.conf:system/etc/gps.conf \
    device/motorola/motus/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/motorola/motus/backoff.conf:system/etc/wifi/backoff.conf

PRODUCT_COPY_FILES += \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.seriomap:system/lib/modules/2.6.27-kernelzilla/modules.seriomap \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.alias:system/lib/modules/2.6.27-kernelzilla/modules.alias \
    device/motorola/motus/modules/2.6.27-kernelzilla/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko:system/lib/modules/2.6.27-kernelzilla/kernel/net/sunrpc/auth_gss/rpcsec_gss_krb5.ko \
    device/motorola/motus/modules/2.6.27-kernelzilla/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko:system/lib/modules/2.6.27-kernelzilla/kernel/net/sunrpc/auth_gss/auth_rpcgss.ko \
    device/motorola/motus/modules/2.6.27-kernelzilla/kernel/fs/fuse/fuse.ko:system/lib/modules/2.6.27-kernelzilla/kernel/fs/fuse/fuse.ko \
    device/motorola/motus/modules/2.6.27-kernelzilla/kernel/fs/cifs/cifs.ko:system/lib/modules/2.6.27-kernelzilla/kernel/fs/cifs/cifs.ko \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.order:system/lib/modules/2.6.27-kernelzilla/modules.order \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.ofmap:system/lib/modules/2.6.27-kernelzilla/modules.ofmap \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.alias.bin:system/lib/modules/2.6.27-kernelzilla/modules.alias.bin \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.ccwmap:system/lib/modules/2.6.27-kernelzilla/modules.ccwmap \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.usbmap:system/lib/modules/2.6.27-kernelzilla/modules.usbmap \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.symbols:system/lib/modules/2.6.27-kernelzilla/modules.symbols \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.dep.bin:system/lib/modules/2.6.27-kernelzilla/modules.dep.bin \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.dep:system/lib/modules/2.6.27-kernelzilla/modules.dep \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.symbols.bin:system/lib/modules/2.6.27-kernelzilla/modules.symbols.bin \
    device/motorola/motus/modules/2.6.27-kernelzilla/modules.inputmap:system/lib/modules/2.6.27-kernelzilla/modules.inputmap

## (2) Also get non-open-source aspects if available
$(call inherit-product-if-exists, vendor/motorola/motus/motus-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

PRODUCT_LOCALES += mdpi

# Discard inherited values and use our own instead.
PRODUCT_NAME := generic_motus
PRODUCT_DEVICE := motus
PRODUCT_MODEL := Android on Motus
