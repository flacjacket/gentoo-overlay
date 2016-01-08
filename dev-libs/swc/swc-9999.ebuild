# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3

DESCRIPTION="A small Wayland compositor implemented as a library"
HOMEPAGE="https://github.com/michaelforney/swc"
EGIT_REPO_URI="https://github.com/michaelforney/swc.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+libinput X"

DEPEND="
	dev-libs/wayland
	dev-libs/libevdev
	dev-libs/wld
	x11-libs/libdrm
	x11-libs/libxkbcommon
	x11-libs/pixman
	libinput? (
		dev-libs/libinput
		virtual/udev
	)
	X? (
		x11-libs/libxcb
		x11-libs/xcb-util-wm
	)"
RDEPEND="${DEPEND}"

src_configure() {
	sed -e "/PREFIX/s:#::" \
		-e "/PREFIX/s:/usr/local:/usr:" \
		-e "/ENABLE_DEBUG/s:1:0:" \
		-e "/ENABLE_STATIC/s:1:0:" \
		-e "/CFLAGS/s:-pipe:${CFLAGS}:" \
		-i config.mk || die

	if ! use X; then
		sed -e "/ENABLE_XWAYLAND/s:1:0:" -i config.mk || die
	fi

	if ! use libinput; then
		sed -e "/ENABLE_LIBINPUT/s:1:0:" -i config.mk ||die
	fi
}
