# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)

PKG_NAME="gzdoom"
PKG_VERSION="5e931f344a91e65d58d2374f3e98740974613272"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/dhwz/gzdoom"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_HOST="toolchain zmusic:host"
PKG_DEPENDS_TARGET="toolchain SDL2 gzdoom:host zmusic"
PKG_SHORTDESC="GZDoom is a modder-friendly OpenGL and Vulkan source port based on the DOOM engine"
PKG_LONGDESC="GZDoom is a modder-friendly OpenGL and Vulkan source port based on the DOOM engine"
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="cmake-make"

pre_build_host() {
  HOST_CMAKE_OPTS=""
}

make_host() {
  cmake . -DNO_GTK=ON
  make
}

makeinstall_host() {
: #no
}

pre_configure_host(){
PKG_CMAKE_OPTS_HOST=" -DZMUSIC_LIBRARIES=$(get_build_dir zmusic)/build_host/source/libzmusic.so \
                      -DZMUSIC_INCLUDE_DIR=$(get_build_dir zmusic)/include"
}

pre_configure_target() {
PKG_CMAKE_OPTS_TARGET=" -DNO_GTK=ON \
                        -DFORCE_CROSSCOMPILE=ON \
                        -DIMPORT_EXECUTABLES=${PKG_BUILD}/.$HOST_NAME/ImportExecutables.cmake \
                        -DCMAKE_BUILD_TYPE=Release \
                        -DHAVE_GLES2=ON \
                        -DHAVE_VULKAN=OFF \
                        -DZMUSIC_LIBRARIES=$(get_build_dir zmusic)/build_target/source/libzmusic.so -DZMUSIC_INCLUDE_DIR=$(get_build_dir zmusic)/include"
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_DIR}/gzdoom.sh ${INSTALL}/usr/bin/
  cp ${PKG_BUILD}/.$TARGET_NAME/gzdoom ${INSTALL}/usr/bin

  mkdir -p ${INSTALL}/usr/config/game/gzdoom
  if [ -d "${PKG_DIR}/config/${DEVICE}" ]
  then
    cp ${PKG_DIR}/config/${DEVICE}/* ${INSTALL}/usr/config/game/gzdoom
  fi
  cp ${PKG_BUILD}/.$TARGET_NAME/*.pk3 ${INSTALL}/usr/config/game/gzdoom
  cp -r ${PKG_BUILD}/.$TARGET_NAME/soundfonts ${INSTALL}/usr/config/game/gzdoom
  cp -r ${PKG_BUILD}/.$TARGET_NAME/fm_banks ${INSTALL}/usr/config/game/gzdoom
}
