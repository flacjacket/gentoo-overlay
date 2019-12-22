# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils

DESCRIPTION="Open source firmware for RC radio transmitters"
HOMEPAGE="http://www.open-tx.org/"
SRC_URI="https://github.com/opentx/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+dfu +phonon"

RDEPEND="
	dev-qt/qtmultimedia:5
	media-libs/libsdl
	x11-libs/fox:*
	dfu? ( app-mobilephone/dfu-util )
	phonon? ( media-libs/phonon )"
DEPEND="${RDEPEND}
	dev-python/PyQt5
	dev-cpp/xsd"

src_compile() {
	cmake-utils_src_compile companion22
}

src_install() {
	exeinto "/usr/bin"
	doexe "${BUILD_DIR}"/companion22
}
