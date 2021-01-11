# Inherit from common
include device/samsung/d2-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/samsung/d2att/BoardConfigVendor.mk

LOCAL_PATH := device/samsung/d2att

# Assert
TARGET_OTA_ASSERT_DEVICE := d2att,d2can

# Kernel
TARGET_KERNEL_VARIANT_CONFIG := lineageos_d2_defconfig
TARGET_KERNEL_CONFIG := lineageos_d2_defconfig

# RIL
BOARD_GLOBAL_CFLAGS += -DRIL_FIX_SMS_NOT_SENT_ERR
