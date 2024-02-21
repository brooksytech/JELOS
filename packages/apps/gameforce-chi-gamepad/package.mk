# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="gameforce-chi-gamepad"
PKG_VERSION="15c7260d4210f2831359d4eaa55d00d275695643"
PKG_SITE="https://github.com/brooksytech/uinput_joystick"
#PKG_SITE="https://github.com/shantigilbert/uinput_joystick"
PKG_URL="$PKG_SITE.git"
PKG_LICENSE="Apachev2+"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="Rockchip uinput joystick for r602"
PKG_TOOLCHAIN="make"

makeinstall_target() {
	mkdir -p $INSTALL/usr/bin/
	cp $PKG_BUILD/uinput_joystick $INSTALL/usr/bin/gameforce-chi-gamepad
	chmod +x $INSTALL/usr/bin/gameforce-chi-gamepad
}

#post_install() {
#	enable_service gameforce_chi_gamepad.service
#}
