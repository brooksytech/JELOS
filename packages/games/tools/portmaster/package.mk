# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present Shanti Gilbert (https://github.com/shantigilbert)
# Maintenance 2021-present 351ELEC (https://github.com/351ELEC)

PKG_NAME="portmaster"
PKG_VERSION="1.0"
PKG_ARCH="any"
PKG_URL="https://github.com/christianhaitian/PortMaster/raw/main/PortMaster.zip"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="A simple tool that allows you to download various game ports that are available for Jelos"
PKG_TOOLCHAIN="manual"

pre_unpack() {
  unzip sources/portmaster/portmaster-1.0.zip -d $PKG_BUILD
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/ports/
  cp -r $PKG_BUILD/PortMaster $INSTALL/usr/config/ports/
}
