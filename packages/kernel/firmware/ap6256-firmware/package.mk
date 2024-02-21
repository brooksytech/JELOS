# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="ap6256-firmware"
PKG_VERSION="6b6f053f6089e08dd2a675cda1ec813de2e842e2"
PKG_LICENSE="Apache"
PKG_SITE="https://github.com/armbian/firmware"
PKG_URL="${PKG_SITE}/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain kernel-firmware"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="ap6256 Linux firmware"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/brcm
#  cp -av * ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/
#  mkdir -p ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/rkwifi
    cp -av brcm/brcmfmac43456-sdio.bin ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/brcm/
 #   cp -av brcm/brcmfmac43456-sdio.clm_blob ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/brcm/
    cp -av brcm/brcmfmac43456-sdio.txt ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/brcm/
 #   cp -av brcm/brcmfmac43456-sdio.bin ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/brcm/brcmfmac43456-sdio.gameforce,ace.bin
 #   cp -av nvram_ap6256.txt ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/
 #   cp -av BCM4345C5.hcd ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/
 #   cp -av brcm/BCM4345C5.hcd ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/brcm/
 #   cp -av fw_bcm43456c5* ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/
 #   cp -av brcm/fw_bcm43456c5* ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/brcm/
 #   cp -av rkwifi/fw_bcm43456c5* ${INSTALL}/$(get_kernel_overlay_dir)/lib/firmware/rkwifi/
}
