#
# Copyright (C) 2014 The CyanogenMod Project
# Copyright (C) 2017 The LineageOS Project
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

DEVICE_PATH                     := device/samsung/d2att-unified
VENDOR_PATH                     := vendor/samsung
PERMISSION_PATH                 := frameworks/native/data/etc

## Inheritances
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product-if-exists, $(VENDOR_PATH)/msm8960-common/msm8960-common-vendor.mk)
$(call inherit-product-if-exists, $(VENDOR_PATH)/d2-common/d2-common-vendor.mk)
$(call inherit-product-if-exists, $(VENDOR_PATH)/d2gsm/d2gsm-vendor.mk)
$(call inherit-product, $(DEVICE_PATH)/system_prop.mk)
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS         += $(DEVICE_PATH)/overlay

# Boot animation and screen size
PRODUCT_AAPT_CONFIG             := normal
PRODUCT_AAPT_PREF_CONFIG        := xhdpi
TARGET_SCREEN_HEIGHT            := 1280
TARGET_SCREEN_WIDTH             := 720
TARGET_BOOTANIMATION_HALF_RES   := true
PRODUCT_PROPERTY_OVERRIDES      += ro.sf.lcd_density=320

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-swap=false

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm8960 \
    audio.r_submix.default \
    audio.usb.default \
    libaudio-resampler \
    tinymix

# Audio configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(DEVICE_PATH)/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    $(DEVICE_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Camera
PRODUCT_PACKAGES += \
    Snap

# Camera Wrapper
PRODUCT_PACKAGES += \
    camera.msm8960

# Configure libhwui
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=48 \
    ro.hwui.layer_cache_size=32 \
    ro.hwui.r_buffer_cache_size=4 \
    ro.hwui.path_cache_size=24 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=5 \
    ro.hwui.texture_cache_flushrate=0.5 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.enable_boot_charger_mode=1

# Display
PRODUCT_PACKAGES += \
    copybit.msm8960 \
    gralloc.msm8960 \
    hwcomposer.msm8960 \
    libgenlock \
    memtrack.msm8960

# Doze
PRODUCT_PACKAGES += \
    SamsungDoze

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960 \
    libgps.utils \
    libloc_core \
    libloc_eng

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/gps/etc/gps.conf:system/etc/gps.conf \
    $(DEVICE_PATH)/gps/etc/sap.conf:system/etc/sap.conf

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/fsa9485.kl:system/usr/keylayout/fsa9485.kl \
    $(DEVICE_PATH)/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    $(DEVICE_PATH)/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    $(DEVICE_PATH)/keylayout/sec_keys.kl:system/usr/keylayout/sec_keys.kl \
    $(DEVICE_PATH)/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    $(DEVICE_PATH)/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    $(DEVICE_PATH)/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl \
    $(DEVICE_PATH)/keylayout/cyttsp-i2c.kl:system/usr/keylayout/cyttsp-i2c.kl \
    $(DEVICE_PATH)/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
    $(DEVICE_PATH)/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    $(DEVICE_PATH)/configs/excluded-input-devices.xml:system/etc/excluded-input-devices.xml

# Lights
PRODUCT_PACKAGES += \
    lights.MSM8960

# Logo
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/initlogo.rle:root/initlogo.rle

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    $(DEVICE_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_PROPERTY_OVERRIDES += \
    qcom.hw.aac.encoder=true \
    ro.config.vc_call_vol_steps=10

PRODUCT_PROPERTY_OVERRIDES += \
    debug.composition.type=dyn \
    ro.opengles.version=131072 \
    camera2.portability.force_api=1 \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.data_netmgrd_nint=16 \
    persist.radio.add_power_save=1 \
    persist.radio.mode_pref_nv10=1 \
    persist.radio.no_wait_for_card=0

PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# Media configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    nfc.msm8960 \
    Nfc \
    Tag \
    com.android.nfc_extras

ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := $(DEVICE_PATH)/configs/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := $(DEVICE_PATH)/configs/nfcee_access_debug.xml
endif
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# OMX
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libstagefrighthw

# Permissions
PRODUCT_COPY_FILES += \
    $(PERMISSION_PATH)/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    $(PERMISSION_PATH)/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    $(PERMISSION_PATH)/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    $(PERMISSION_PATH)/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    $(PERMISSION_PATH)/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    $(PERMISSION_PATH)/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    $(PERMISSION_PATH)/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    $(PERMISSION_PATH)/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    $(PERMISSION_PATH)/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    $(PERMISSION_PATH)/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    $(PERMISSION_PATH)/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    $(PERMISSION_PATH)/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    $(PERMISSION_PATH)/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    $(PERMISSION_PATH)/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(PERMISSION_PATH)/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    $(PERMISSION_PATH)/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    $(PERMISSION_PATH)/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    $(PERMISSION_PATH)/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    $(PERMISSION_PATH)/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    $(PERMISSION_PATH)/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    $(PERMISSION_PATH)/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    $(PERMISSION_PATH)/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

# Power
PRODUCT_PACKAGES += \
    power.msm8960

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.led.sh \
    init.qcom.power.rc \
    init.qcom.rc \
    init.qcom.usb.rc \
    ueventd.qcom.rc

# Samsung symbols
PRODUCT_PACKAGES += \
    libsamsung_symbols

# Sensors
PRODUCT_COPY_FILES += \
    $(PERMISSION_PATH)/android.hardware.sensor.ambient_temperature.xml:system/etc/permissions/android.hardware.sensor.ambient_temperature.xml

# SPN override
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

# Stlport
PRODUCT_PACKAGES += \
    libstlport

# Voice processing
PRODUCT_PACKAGES += \
    libqcomvoiceprocessing

# Wifi
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(DEVICE_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    hostapd \
    hostapd_default.conf \
    libwpa_client \
    macloader \
    wpa_supplicant \
    wpa_supplicant.conf \
    libnetcmdiface