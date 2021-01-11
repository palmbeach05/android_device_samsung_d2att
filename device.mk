#Inherit from vendor
$(call inherit-product-if-exists, vendor/samsung/d2att/d2att-vendor.mk)

# Inherit from common
$(call inherit-product, device/samsung/d2-common/device-common.mk)

LOCAL_PATH := device/samsung/d2att

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Common overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
