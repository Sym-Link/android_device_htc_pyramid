# Copyright (C) 2009 The Android Open Source Project
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

# msm8660-common overrides #

# use this section to override any build flags from msm8660-common
# WARNING: Anything below the -include line will be overridden by 
# BoardConfigCommon.mk in the msm8660-common repo.

# Audio
TARGET_QCOM_AUDIO_VARIANT := legacy

# OVERRIDES END #

# inherit from common msm8660
-include device/htc/msm8660-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := pyramid

# Kernel [Settings]
BOARD_KERNEL_BASE := 0x48000000
BOARD_KERNEL_PAGE_SIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0 androidboot.hardware=pyramid no_console_suspend=1

# Kernel [Build]
TARGET_KERNEL_CONFIG := pyramid_defconfig
TARGET_KERNEL_SOURCE := kernel/htc/pyramid
TARGET_KERNEL_CUSTOM_TOOLCHAIN := linaro
BUILD_KERNEL := true

# Bluetooth/Wifi
-include device/htc/msm8660-common/bcmdhd.mk

# Qcom GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := pyramid

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# RIL
BOARD_USES_LEGACY_RIL := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776192
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 838859776
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1252770816
BOARD_FLASH_BLOCK_SIZE := 262144
