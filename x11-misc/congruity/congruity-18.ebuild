# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 xdg-utils

DESCRIPTION="GUI application for programming Logitech Harmony remote controls"
HOMEPAGE="https://sourceforge.net/projects/congruity/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/wxpython:3.0
		dev-libs/libconcord[python]
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-wxpython-3.0.patch"
	"${FILESDIR}/${PN}-login-fixes.patch"
	"${FILESDIR}/${PN}-supported-capabilities.patch"
	"${FILESDIR}/${PN}-fix-setun-login-url.patch"
)

src_prepare() {
	default

	python_fix_shebang congruity mhgui mhmanager.py
}

src_install() {
	emake RUN_UPDATE_DESKTOP_DB=0 PREFIX="${EPREFIX}"/usr DESTDIR="${D}" install

	dodoc README.txt Changelog
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
