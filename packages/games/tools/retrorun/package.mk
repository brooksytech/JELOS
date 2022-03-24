# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)

PKG_NAME="retrorun"
PKG_VERSION="cc0f047777bd2eceba8df86d50cd238cc68d5bf4"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/351ELEC/retrorun-go2"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain libgo2 libdrm libpng linux"
PKG_TOOLCHAIN="make"
GET_HANDLER_SUPPORT="git"

pre_make_target() {
  mkdir -p src/go2
  cp -f $SYSROOT_PREFIX/usr/include/go2/*.h src/go2
}

pre_configure_target() {
  CFLAGS+=" -I$(get_build_dir libdrm)/include/drm"
  CFLAGS+=" -I$(get_build_dir linux)/include/uapi"
  CFLAGS+=" -I$(get_build_dir linux)/tools/include"
}

make_target() {
  make config=release ARCH=
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  if [ "${ARCH}" != "aarch64" ]; then
    cp retrorun $INSTALL/usr/bin/retrorun32
  else
    cp retrorun $INSTALL/usr/bin
    cp $PKG_DIR/retrorun.sh $INSTALL/usr/bin
    cp -vP $PKG_BUILD/../../build.${DISTRO}-${DEVICE}.arm/retrorun-*/.install_pkg/usr/bin/retrorun32 $INSTALL/usr/bin
    mkdir -p $INSTALL/usr/config/game/configs/retrorun
    cp -vP $PKG_DIR/retrorun.cfg $INSTALL/usr/config/game/configs/retrorun
  fi
}
