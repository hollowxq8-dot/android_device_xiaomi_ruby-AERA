#!/usr/bin/env bash
#
# AERA Recovery build variables for Xiaomi Redmi Note 12 Pro / Pro+ / Discovery (ruby/rubyx)
#

FDEVICE="ruby"

aera_get_target_device() {
	export script_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"
	if echo "$script_path" | grep -q "$FDEVICE"; then
		AERA_BUILD_DEVICE="$FDEVICE"
	elif echo "$0" | grep -q "$FDEVICE"; then
		AERA_BUILD_DEVICE="$FDEVICE"
	fi
}

if [ -z "$AERA_BUILD_DEVICE" ]; then
	aera_get_target_device
fi

if [ "$AERA_BUILD_DEVICE" = "$FDEVICE" ]; then
	echo "Detected build device: $AERA_BUILD_DEVICE"

	export AERA_BUILD_DEVICE="ruby"
	export AERA_TARGET_DEVICES="ruby,rubyx,rubypro,rubyplus,ruby_pro,ruby_plus"
	export PRODUCT_DEVICE="ruby"

	# Build metadata
	export AERA_BUILD_TYPE="Stable"
	export AERA_BUILD_STATUS="Unofficial"
	export AERA_DEFAULT_THEME="amoled"
	export AERA_USE_BLACK_THEME=1
	export OF_USE_BLACK_THEME=1
	unset AERA_VARIANT
	unset AERA_MAINTAINER_PATCH_VERSION

	# Recovery-as-Boot (MediaTek MT6877 Virtual A/B uses boot partition for recovery)
	export AERA_AB_DEVICE=1
	export AERA_VIRTUAL_AB_DEVICE=1
	export AERA_RECOVERY_BOOT_PARTITION="/dev/block/by-name/boot"
	export AERA_RECOVERY_INSTALL_PARTITION="/dev/block/by-name/boot"
	export AERA_REPLACE_BOOTIMAGE_RAMDISK=1

	# Compression & shell binaries
	export AERA_USE_BASH_SHELL=1
	export AERA_ASH_IS_BASH=1
	export AERA_USE_NANO_EDITOR=1
	export AERA_USE_TAR_BINARY=1
	export AERA_USE_SED_BINARY=1
	export AERA_USE_GREP_BINARY=1
	export AERA_USE_XZ_UTILS=1
	export AERA_USE_LZ4_BINARY=1
	export AERA_USE_ZSTD_BINARY=1
	export AERA_USE_BUSYBOX_BINARY=1
	export AERA_DELETE_AROMAFM=1
	export AERA_REMOVE_AAPT=1

	# Settings & magiskboot
	export AERA_USE_MAGISKBOOT=1
	export AERA_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
	export AERA_SETTINGS_ROOT_DIRECTORY="/persist"
	export AERA_ALLOW_EARLY_SETTINGS_LOAD=1
	export AERA_RESET_SETTINGS="disabled"
else
	echo "I: vendorsetup.sh skipped; device mismatch or environment issue."
fi
