# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit python-single-r1

DESCRIPTION="GUI application for programming Logitech Harmony remote controls"
HOMEPAGE="http://sourceforge.net/projects/congruity/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/wxpython:2.8
		dev-libs/libconcord[python]
"
RDEPEND="${DEPEND}"

src_prepare() {
	python_fix_shebang congruity mhgui mhmanager.py

	epatch "${FILESDIR}"/${P}-wxwidgets-2.8.patch
}

src_install() {
	emake RUN_UPDATE_DESKTOP_DB=0 PREFIX="${EPREFIX}"/usr DESTDIR="${D}" install

	dodoc README.txt Changelog
}
