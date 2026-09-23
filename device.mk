#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/lava/LXX516
# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \
    android.hardware.boot-V1-ndk \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.1 \
    android.hardware.boot@1.2 \
    android.hardware.boot@1.2-impl

PRODUCT_PACKAGES += \
    bootctrl.ums9621

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
    bootctrl.ums9621 \
    libgptutils \
    libz \
    libcutils

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# building vendor_boot
PRODUCT_BUILD_SUPER_PARTITION  := false

# API
PRODUCT_SHIPPING_API_LEVEL := 34
PRODUCT_TARGET_VNDK_VERSION := 34
BOARD_SHIPPING_API_LEVEL := 34
SHIPPING_API_LEVEL := 34

# firmware symlink 
BOARD_ROOT_EXTRA_SYMLINKS += \
    /vendor/firmware:/vendor/odm/firmware
    
    # A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true
    
PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload \
    checkpoint_gc

PRODUCT_PACKAGES += \
    vold.recovery \
    vold_prepare_subdirs.recovery \
    wait_for_keymaster.recovery
    
    # Fastboot & FastbootD 
PRODUCT_PACKAGES += \
    android.hardware.fastboot-V1-ndk \
    android.hardware.fastboot@1.0 \
    android.hardware.fastboot@1.1 \
    fastbootd
    
    # Keymaster - maybe different for your device, check that if Decryption fails. 
PRODUCT_PACKAGES += \
    android.hardware.keymaster@4.1
    
    # Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret
    
    PRODUCT_PACKAGES += \
    e2fsck.vendor_ramdisk \
    fsck.f2fs.vendor_ramdisk \
    resize2fs.vendor_ramdisk \
    tune2fs.vendor_ramdisk
    
    # Keystore2 -For Decryption 
PRODUCT_PACKAGES += \
    android.system.keystore2
    
    # Additional Target Libraries - 2X
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hardware.keymaster@4.1 \
    android.hardware.keymaster-V4-ndk.so \
    android.hardware.graphics.common@1.0 \
    libion \
    libxml2 \
    android.hardware.boot@1.0 \
    android.hardware.boot@1.1 \
    android.hardware.boot-V1-ndk
    
    # Copy first-stage fstabs to vendor_ramdisk — required by first-stage init (to boot into recovery::: !!! Attention: this is only a dummy flag, from beryl. add your stock fstab to first_stage_ramdisk to boot into recovery ( Recovery might not boot without fstab)
    
# PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/recovery/root/first_stage_ramdisk/fstab.mt6855:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.mt6855 \
#    $(LOCAL_PATH)/recovery/root/first_stage_ramdisk/fstab.emmc:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.emmc


# still need some work. try-fail. 
# a few things depends on how your device works. 
# after successfully booting to recovery, you can fix other things. 
# @IQ_HARRY_07