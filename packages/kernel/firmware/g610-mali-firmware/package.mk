# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="g610-mali-firmware"
PKG_VERSION="0c1c1b8e3a687fd10df38935c4dff9ab90285a09"
PKG_LICENSE="nonfree"
PKG_ARCH="arm aarch64"
PKG_SITE="https://github.com/JustEnoughLinuxOS/libmali"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain mesa"
PKG_LONGDESC="Mesa Panthor firmware for RK3588 g610 mali gpu"
PKG_TOOLCHAIN="manual"
PKG_PATCH_DIRS+="${DEVICE}"

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_firmware_dir)/arm/mali/arch10.8/
  cp -rf ${PKG_BUILD}/firmware/g610/mali_csffw.bin ${INSTALL}/$(get_full_firmware_dir)/arm/mali/arch10.8/mali_csffw.bin
}
