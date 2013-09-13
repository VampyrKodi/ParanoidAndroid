# Copyright (C) 2012 ParanoidAndroid Project
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

# Check for target product
ifeq (pa_n8013,$(TARGET_PRODUCT))

# Define PA bootanimation size
PARANOID_BOOTANIMATION_NAME := HDPI

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_n8013

# Build paprefs from sources
PREFS_FROM_SOURCE ?= true

# Include ParanoidAndroid common configuration
include vendor/pa/config/pa_common.mk

# Inherit AOSP device configuration
$(call inherit-product, device/samsung/n8013/full_n8013.mk)

# Product Package Extras - Repos can be added manually or via addprojects.py
-include vendor/pa/packages/n8013.mk

# CM Package Extras
-include vendor/pa/packages/cm.mk

# Override AOSP build properties
PRODUCT_NAME := pa_n8013
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-N8013
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-N8013 TARGET_DEVICE=n8013 BUILD_FINGERPRINT="samsung/p4notewifiue/p4notewifi:4.2.2/JZO54K/N8013UEUCMA3:user/release-keys" PRIVATE_BUILD_DESC="samsung/p4notewifiue/p4notewifi:4.2.2/JZO54K/N8013UEUCMA3:user/release-keys"

# Update local_manifest.xml
GET_VENDOR_PROPS := $(shell vendor/pa/tools/getvendorprops.py $(PRODUCT_NAME))
GET_PROJECT_RMS := $(shell vendor/pa/tools/removeprojects.py $(PRODUCT_NAME))
GET_PROJECT_ADDS := $(shell vendor/pa/tools/addprojects.py $(PRODUCT_NAME))
GET_CM_PROJECT_ADDS := $(shell vendor/pa/tools/addprojects.py cm.adds)

endif
