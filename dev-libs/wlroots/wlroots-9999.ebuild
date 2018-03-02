# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit meson git-r3

DESCRIPTION="A modular Wayland compositor library"
HOMEPAGE="https://github.com/swaywm/wlroots"
EGIT_REPO_URI="https://github.com/swaywm/wlroots.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="elogind +libcap systemd +xwayland"

DEPEND="
	dev-libs/wayland
	dev-libs/wayland-protocols
	media-libs/mesa[egl,gbm,gles2,wayland]
	x11-drivers/xf86-input-libinput
	x11-libs/pixman
	elogind? ( sys-auth/elogind )
	libcap? ( sys-libs/libcap )
	systemd? ( sys-apps/systemd )"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_use elogind enable_elogind)
		$(meson_use libcap enable_libcap)
		$(meson_use systemd enable_systemd)
		$(meson_use xwayland enable_xwayland)
	)
	meson_src_configure
}
