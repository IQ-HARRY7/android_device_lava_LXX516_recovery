#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2025 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

# screen settings
# e.g. if the aspect ratio is 19:9 then use 19*120 (=2280)

# make file for LXX516 
# OF variable file
#

 # change it so your name should show in the about page.
OF_MAINTAINER := 🔥IQ_HARRY_07🔥


# Skip Decryption (to prevent from stucking on OrangeFox splash screen! don't remove unless you're sure that you're going to work on Decryption!)

OF_SKIP_FBE_DECRYPTION := 1

# Screen settings - specified values from beryl. change if you found any issue (ONLY IF YOU FOUND ANY ISSUE!)

OF_SCREEN_H := 2400
OF_STATUS_H := 100
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_ALLOW_DISABLE_NAVBAR := 0
OF_CLOCK_POS := 1
OF_OPTIONS_LIST_NUM := 9

# No Dedicated Recovery partition 
OF_AB_DEVICE_WITH_RECOVERY_PARTITION := 0

# automatically wipe /metadata after data format
OF_WIPE_METADATA_AFTER_DATAFORMAT := 1

# lz4 compression
OF_USE_LZ4_COMPRESSION := 1

# Called just before formatting /data; only useful for devices/ROMs that have dynamic partitions
OF_USE_DMCTL := 1

# Set this to 1 if your device uses aidl (as opposed to hidl) to handle boot control, particularly changing slots
OF_USE_AIDL_BOOT_CONTROL := 1

# Set this to 1 if your device uses aidl (as opposed to hidl) to handle boot control, particularly changing slots
OF_USE_AIDL_BOOT_CONTROL := 1

