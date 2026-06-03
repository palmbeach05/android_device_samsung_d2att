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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

DEVICE_PATH 									:= device/samsung/d2att-unified

# Inheritances
-include device/samsung/qcom-common/BoardConfigCommon.mk
-include vendor/samsung/d2att/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH						+= $(DEVICE_PATH)/include

# CPU & Architecture
TARGET_BOARD_PLATFORM							:= msm8960
TARGET_BOARD_PLATFORM_GPU 						:= qcom-adreno200
TARGET_CPU_VARIANT								:= krait

# Bootloader & Board
TARGET_BOOTLOADER_BOARD_NAME					:= MSM8960

# Assert
TARGET_OTA_ASSERT_DEVICE 						:= d2att,d2lte,d2can,d2tmo

# Audio
BOARD_USES_ALSA_AUDIO							:= true
BOARD_HAVE_AUDIENCE_A2220						:= true
BOARD_HAVE_SAMSUNG_CSDCLIENT					:= true
USE_CUSTOM_AUDIO_POLICY							:= 1

# Bluetooth
BOARD_HAVE_BLUETOOTH 							:= true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR		:= $(DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG 							:= $(DEVICE_PATH)/bluetooth/vnd_d2.txt
BOARD_HAVE_BLUETOOTH_BCM 						:= true
BOARD_HAVE_SAMSUNG_BLUETOOTH 					:= true

# Camera
TARGET_IS_DERP2 								:= true
TARGET_HAS_LEGACY_CAMERA_HAL1 					:= true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS 			:= true
TARGET_PROVIDES_CAMERA_HAL 						:= true
USE_DEVICE_SPECIFIC_CAMERA 						:= true

# Charger
BOARD_BATTERY_DEVICE_NAME 						:= "battery"
BOARD_CHARGING_CMDLINE_NAME 					:= "androidboot.bootchg"
BOARD_CHARGING_CMDLINE_VALUE 					:= "true"
BOARD_CHARGER_ENABLE_SUSPEND 					:= true
BOARD_CHARGER_SHOW_PERCENTAGE 					:= true

# CMHW
BOARD_HARDWARE_CLASS 							+= $(DEVICE_PATH)/cmhw

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS 				:= 3
TARGET_DISPLAY_INSECURE_MM_HEAP 				:= true
TARGET_DISPLAY_USE_RETIRE_FENCE 				:= true
TARGET_NO_ADAPTIVE_PLAYBACK 					:= true

# Fonts
EXTENDED_FONT_FOOTPRINT 						:= true

# GPS
TARGET_NO_RPC 									:= true
USE_DEVICE_SPECIFIC_GPS 						:= true

# Init
TARGET_INIT_VENDOR_LIB                          := libinit_d2

# Kernel
TARGET_KERNEL_CONFIG        					:= lineageos_d2_defconfig
BOARD_KERNEL_CMDLINE 							:= \
	androidboot.hardware=qcom \
	user_debug=31 \
	zcache
BOARD_KERNEL_BASE 								:= 0x80200000
BOARD_MKBOOTIMG_ARGS 							:= --ramdisk_offset 0x01500000
BOARD_KERNEL_PAGESIZE 							:= 2048
TARGET_KERNEL_SOURCE 							:= kernel/samsung/d2

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE 					:= 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE 				:= 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE 				:= 1572864000
BOARD_USERDATAIMAGE_PARTITION_SIZE 				:= 13140754432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE 				:= ext4
BOARD_CACHEIMAGE_PARTITION_SIZE 				:= 880803840
TARGET_RECOVERY_FSTAB 							:= $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_F2FS 						:= true
TARGET_USERIMAGES_USE_EXT4 						:= true
BOARD_FLASH_BLOCK_SIZE 							:= 131072

# Build our own PowerHAL
TARGET_POWERHAL_VARIANT 						:=

# Radio & RIL
BOARD_GLOBAL_CFLAGS 							+= -DDISABLE_ASHMEM_TRACKING
BOARD_RIL_CLASS 								:= $(DEVICE_PATH)/ril

# Recovery
TARGET_RECOVERY_DENSITY 						:= hdpi
BOARD_USE_CUSTOM_RECOVERY_FONT 					:= \"roboto_15x24.h\"
BOARD_USES_MMCUTILS 							:= true
BOARD_HAS_LARGE_FILESYSTEM 						:= true
BOARD_HAS_NO_SELECT_BUTTON 						:= true
BOARD_RECOVERY_SWIPE 							:= true

# SDClang
TARGET_USE_SDCLANG 								:= true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS 							+= $(DEVICE_PATH)/sepolicy

# Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR 				:= true
BOARD_VOLD_MAX_PARTITIONS 						:= 28
TARGET_USE_CUSTOM_LUN_FILE_PATH 				:= /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_WLAN_DEVICE 								:= bcmdhd
BOARD_HAVE_SAMSUNG_WIFI 						:= true
BOARD_HOSTAPD_DRIVER 							:= NL80211
BOARD_HOSTAPD_PRIVATE_LIB 						:= lib_driver_cmd_${BOARD_WLAN_DEVICE}
BOARD_WPA_SUPPLICANT_DRIVER 					:= NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB 				:= lib_driver_cmd_${BOARD_WLAN_DEVICE}
WPA_SUPPLICANT_VERSION 							:= VER_0_8_X
WIFI_DRIVER_FW_PATH_PARAM   					:= "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     					:= "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      					:= "/system/etc/wifi/bcmdhd_apsta.bin"