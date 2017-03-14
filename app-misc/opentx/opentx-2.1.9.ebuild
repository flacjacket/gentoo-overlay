# Copyright 1999-2017 Gentoo Foundation
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
	dev-libs/xerces-c
	media-libs/libsdl
	x11-libs/fox:1.6
	dfu? ( app-mobilephone/dfu-util )
	phonon? ( media-libs/phonon )"
DEPEND="${RDEPEND}
	dev-python/PyQt4
	dev-vcs/subversion
	dev-cpp/xsd"

CMAKE_USE_DIR="${S}/companion/src"
