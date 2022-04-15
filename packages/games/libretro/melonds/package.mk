PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://git.libretro.com/libretro/melonDS"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain $OPENGLES"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="MeloDS - Nintendo DS emulator for libretro"
PKG_TOOLCHAIN="make"

rm -rf CmakeList.txt

pre_make_target() {

  if [[ "${DEVICE}" =~ RG351 ]]
  then
    PKG_MAKE_OPTS_TARGET=" platform=odroidgoa"
  elif [[ "${DEVICE}" =~ RG552 ]]
  then
    PKG_MAKE_OPTS_TARGET=" platform=RK3399"
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp melonds_libretro.so $INSTALL/usr/lib/libretro/
}
