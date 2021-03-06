#
# Copyright (C) 2012 The Android Open-Source Project
# Copyright (C) 2012 mdeejay
# Copyright (C) 2013 faust93
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
$(call inherit-product-if-exists, vendor/huawei/front/front-vendor.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

COMMON_PATH := device/huawei/front

# This file includes all definitions that apply to ALL front devices, and
# are also specific to front devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/huawei/front/overlay

# Audio Packages
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default \
	libtinyalsa \
	tinycap \
	tinymix \
	tinyplay \
	libaudioutils

PRODUCT_PACKAGES += \
    libnetcmdiface

# PowerHAL
PRODUCT_PACKAGES += \
	audio.primary.front \
	power.front \
	hwcomposer.front \
	libedid \
	libion_ti \
	libstagefrighthw \
	smc_pa_ctrl \
	tf_daemon

# Ramdisk
PRODUCT_COPY_FILES += \
	device/huawei/front/ramdisk/init.front.rc:root/init.front.rc \
	device/huawei/front/ramdisk/init.front.usb.rc:root/init.front.usb.rc \
	device/huawei/front/ramdisk/ueventd.front.rc:root/ueventd.front.rc \
	device/huawei/front/ramdisk/fstab.front:root/fstab.front

# Media / Audio
PRODUCT_COPY_FILES += \
	device/huawei/front/media/media_profiles.xml:system/etc/media_profiles.xml \
	device/huawei/front/media/media_codecs.xml:system/etc/media_codecs.xml \
	device/huawei/front/audio/audio_policy.conf:system/etc/audio_policy.conf \
	device/huawei/front/audio/huawei/audio/cm_front_audio_config.conf:system/etc/huawei/audio/cm_front_audio_config.conf \
	device/huawei/front/audio/huawei/audio/front_audio_config.conf:system/etc/huawei/audio/front_audio_config.conf \
	device/huawei/front/audio/huawei/audio/front_factory_audio_config.conf:system/etc/huawei/audio/front_factory_audio_config.conf \
	device/huawei/front/audio/huawei/audio/U9500_audio_config.conf:system/etc/huawei/audio/U9500_audio_config.conf \
	device/huawei/front/audio/huawei/audio/U9500_factory_audio_config.conf:system/etc/huawei/audio/U9500_factory_audio_config.conf

# GPS
PRODUCT_COPY_FILES += \
	device/huawei/front/gps/gps.conf:system/etc/gps.conf \
	device/huawei/front/gps/gpsconfig.xml:system/etc/gpsconfig.xml

# BT
PRODUCT_COPY_FILES += \
	device/huawei/front/config/BCM4330B1.hcd:system/etc/bluetooth/BCM4330B1.hcd \
	device/huawei/front/config/init.bcm.chip_off.sh:system/etc/bluetooth/init.bcm.chip_off.sh \
	device/huawei/front/config/init.bcm.chip_on.sh:system/etc/bluetooth/init.bcm.chip_on.sh

# Wi-Fi
PRODUCT_COPY_FILES += \
	device/huawei/front/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# Torch
PRODUCT_PACKAGES += \
        Torch

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# Common
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs \
	e2fsck \
	l2ping \
	com.android.future.usb.accessory

# Key maps
PRODUCT_COPY_FILES += \
	device/huawei/front/usr/omap4-keypad.kl:system/usr/keylayout/omap4-keypad.kl \
	device/huawei/front/usr/omap4-keypad.kcm:system/usr/keychars/omap4-keypad.kcm \
	device/huawei/front/usr/twl6030_pwrbutton.kl:system/usr/keylayout/twl6030_pwrbutton.kl

# Input device calibration files
PRODUCT_COPY_FILES += \
	device/huawei/front/usr/syn_tm12xx_ts_1.idc:system/usr/idc/syn_tm12xx_ts_1.idc \
	device/huawei/front/usr/syn_tm12xx_ts_2.idc:system/usr/idc/syn_tm12xx_ts_2.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists,\
packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

#Lib Skia test
PRODUCT_PACKAGES += \
	SkLibTiJpeg_Test

PRODUCT_PROPERTY_OVERRIDES += \
	ro.setupwizard.enable_bypass=1 \
	dalvik.vm.dexopt-flags=m=y \
	ro.product.board=U9500

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0

PRODUCT_CHARACTERISTICS := default
#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
#PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
PRODUCT_LOCALES += en_US hdpi
BOARD_WLAN_DEVICE_REV := bcm4330_b1
WIFI_BAND             := 802_11_ABG

