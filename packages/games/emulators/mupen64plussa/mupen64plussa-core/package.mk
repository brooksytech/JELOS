# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="mupen64plussa-core"
PKG_VERSION="49dd0bfc8f48afd04ddd1762ea9d9e89a85fc8a2"
PKG_SHA256="dc1c344044bebaacc1aa4dcc7cb072cbd3677261bfe4f4e748fe6144f02f08b3"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/mupen64plus/mupen64plus-core"
PKG_URL="https://github.com/mupen64plus/mupen64plus-core/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain ${OPENGLES} boost libpng SDL2 SDL2_net zlib freetype nasm:host"
PKG_SHORTDESC="mupen64plus"
PKG_LONGDESC="Mupen64Plus Standalone"
PKG_TOOLCHAIN="manual"

PKG_MAKE_OPTS_TARGET+="USE_GLES=1"

make_target() {
  export HOST_CPU=aarch64
  export USE_GLES=1
  export SDL_CFLAGS="-I$SYSROOT_PREFIX/usr/include/SDL2 -D_REENTRANT"
  export SDL_LDLIBS="-lSDL2_net -lSDL2"
  export CROSS_COMPILE="$TARGET_PREFIX"
  export V=1
  export VC=0
  BINUTILS="$(get_build_dir binutils)/.aarch64-libreelec-linux-gnueabi"
  make -C projects/unix clean
  make -C projects/unix all ${PKG_MAKE_OPTS_TARGET}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/local/lib
  cp ${PKG_BUILD}/projects/unix/libmupen64plus.so.2.0.0 ${INSTALL}/usr/local/lib
  chmod 644 ${INSTALL}/usr/local/lib/libmupen64plus.so.2.0.0
  cp ${PKG_BUILD}/projects/unix/libmupen64plus.so.2 ${INSTALL}/usr/local/lib
  mkdir -p ${INSTALL}/usr/local/share/mupen64plus
  cp ${PKG_BUILD}/data/* ${INSTALL}/usr/local/share/mupen64plus
  chmod 0644 ${INSTALL}/usr/local/share/mupen64plus/*
  mkdir -p ${INSTALL}/usr/local/include/mupen64plus
  cp ${PKG_BUILD}/src/api/m64p_*.h ${INSTALL}/usr/local/include/mupen64plus
  chmod 0644 ${INSTALL}/usr/local/include/mupen64plus/*

  cp ${PKG_DIR}/config/mupen64plus-${DEVICE}.cfg ${INSTALL}/usr/local/share/mupen64plus/mupen64plus.cfg
  chmod 644 ${INSTALL}/usr/local/share/mupen64plus/mupen64plus.cfg
  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_DIR}/m64p.sh ${INSTALL}/usr/bin
  chmod 755 ${INSTALL}/usr/bin/m64p.sh
}

