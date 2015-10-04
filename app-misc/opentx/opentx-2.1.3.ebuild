# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="Open source firmware for RC radio transmitters"
HOMEPAGE="http://www.open-tx.org/"
SRC_URI="https://github.com/opentx/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+phonon"

RDEPEND="
	dev-libs/xerces-c
	phonon? ( media-libs/phonon )"
DEPEND="${RDEPEND}
	dev-python/PyQt4
	dev-vcs/subversion
	dev-cpp/xsd"

CMAKE_USE_DIR="${S}/companion/src"

src_prepare() {
	sed -e 's/env python/env python2.7/' -i radio/util/*.py || die
	sed -e 's/@python/@python2.7/' -i radio/src/Makefile || die

	cmake-utils_src_prepare
}
