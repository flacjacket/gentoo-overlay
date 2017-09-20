# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils udev

DESCRIPTION="Open source version of the STMicroelectronics Stlink Tools"
HOMEPAGE="https://github.com/texane/stlink"
SRC_URI="https://github.com/texane/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk"

DEPEND="
	virtual/libusb:1
	gtk? ( x11-libs/gtk+:3 )
"
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DSTLINK_UDEV_RULES_DIR=$(get_udevdir)
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	dodoc ChangeLog.md README.md
}
