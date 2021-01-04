# Default ADB shell prompt
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.adb.shell=/system/xbin/bash

# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product, vendor/gapps/common/common-vendor.mk)
endif
