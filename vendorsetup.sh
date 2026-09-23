#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# device codename 
FDEVICE="LXX516"

# device codename match & build device set. 
fox_get_target_device() {
    local chkdev=""

    if [ -n "$ZSH_VERSION" ]; then
        local current_source="${(%):-%x}"
        chkdev=$(echo "$current_source" | grep -w "$FDEVICE")
    elif [ -n "$BASH_VERSION" ]; then
    	chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
    fi

    if [ -n "$chkdev" ]; then
    	FOX_BUILD_DEVICE="$FDEVICE"
    else
        if [ -n "$BASH_VERSION" ]; then
 		chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
        elif [ -n "$ZSH_VERSION" ]; then
		chkdev=$(echo "$*" | grep -w "$FDEVICE")
	fi
	[ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
    fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
	fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then


 # Export Flags 
 
    export LC_ALL="C"
    export ALLOW_MISSING_DEPENDENCIES=true
 
    export FOX_VENDOR_BOOT_RECOVERY=1
    export FOX_VANILLA_BUILD=1
    export FOX_TARGET_DEVICES="LXX516"
    
    export FOX_AB_DEVICE=1
    export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
    export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
    
    # Binaries & Tools
    export FOX_USE_BASH_SHELL=1
    export FOX_USE_LZ4_BINARY=1
    export FOX_USE_DATE_BINARY=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    
    # OrangeFox Addons
    export FOX_DELETE_AROMAFM=1
    export FOX_DELETE_INITD_ADDON=1
    
    # KernelSU-Next Support 
    export FOX_ENABLE_KERNELSU_NEXT_SUPPORT=1 
    
    else
    if [ -z "$FOX_BUILD_DEVICE" ] && [ -z "$BASH_SOURCE" ] && [ -z "$ZSH_VERSION" ]; then
	echo "I: This script requires bash or zsh. Not processing $FDEVICE"
    fi
fi

#