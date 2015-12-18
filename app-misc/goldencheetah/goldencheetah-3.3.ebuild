# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit qt4-r2

MY_PN="GoldenCheetah"

DESCRIPTION="Cycling performance software"
HOMEPAGE="http://www.goldencheetah.org/"
SRC_URI="https://github.com/GoldenCheetah/${MY_PN}/archive/V${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+qwt"

DEPEND="dev-qt/qtcore:4
	qwt? ( x11-libs/qwtplot3d )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}"

src_prepare() {
	sed -e "s:#QMAKE_LRELEASE:QMAKE_LRELEASE:" \
		-e "s:#QMAKE_CXXFLAGS:QMAKE_CXXFLAGS:" src/gcconfig.pri.in > src/gcconfig.pri || die
	sed -e "s:/usr/local/:/usr/:" qwt/qwtconfig.pri.in > qwt/qwtconfig.pri || die
}

src_configure() {
	if use qwt; then
		sed -e "s:#QWT3D_INSTALL =:QWT3D_INSTALL = /usr:" \
			-e "s:#QWT3D_INCLUDE =:QWT3D_INCLUDE = \$\${QWT3D_INSTALL}/include/qwtplot3d:" \
			-e "s:#QWT3D_LIBS    =:QWT3D_LIBS    = \$\${QWT3D_INSTALL}/lib/libqwtplot3d.so:" \
			-e "s:#DEFINES += GC_VIDEO_NONE:DEFINES += GC_VIDEO_NONE:" \
			-i src/gcconfig.pri || die
	fi

	eqmake4 -recursive
}

src_install() {
	qt4-r2_src_install

	dobin "src/GoldenCheetah"
}