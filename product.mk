EXTRA_PATH := vendor/extra

# ADB
ifneq (,$(wildcard $(EXTRA_PATH)/adbkey.pub))
PRODUCT_ADB_KEYS := $(EXTRA_PATH)/adbkey.pub
endif

# Bellis
ifneq (,$(wildcard packages/apps/Bellis))
PRODUCT_PACKAGES += Bellis
endif

# F-Droid
ifneq (,$(wildcard external/F-Droid))
PRODUCT_PACKAGES += F-Droid
endif

# F-Droid Privileged Extension
ifneq (,$(wildcard packages/apps/F-DroidPrivilegedExtension))
PRODUCT_PACKAGES += F-DroidPrivilegedExtension
endif

# LogViewer
ifneq (,$(wildcard packages/apps/LogViewer))
PRODUCT_PACKAGES += LogViewer
endif

# Custom OTA endpoint
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    lineage.updater.uri=https://raw.githubusercontent.com/Tomoms/ota_provider/master/23.x/{device}.json

# Default ADB shell prompt
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.adb.shell=/system_ext/bin/bash

# Google Apps
ifeq ($(WITH_GMS), true)
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)
endif

# PIF values
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_MANUFACTURER?=Google \
    persist.sys.pihooks_BRAND?=google \
    persist.sys.pihooks_PRODUCT?=blazer_beta \
    persist.sys.pihooks_DEVICE?=blazer \
    persist.sys.pihooks_ID?=CP21.260306.017 \
    persist.sys.pihooks_RELEASE?=17 \
    persist.sys.pihooks_SECURITY_PATCH?=2026-03-05 \
    persist.sys.pihooks_DEVICE_INITIAL_SDK_INT?=21 \
    persist.sys.pihooks_SDK_INT?=32

PRODUCT_BUILD_PROP_OVERRIDES += \
    PihooksGmsFp="google/blazer_beta/blazer:17/CP21.260306.017/15063635:user/release-keys" \
    PihooksGmsModel="Pixel 10 Pro"
