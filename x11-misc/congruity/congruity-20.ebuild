# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{8..10} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1 xdg-utils

DESCRIPTION="GUI application for programming Logitech Harmony remote controls"
HOMEPAGE="https://sourceforge.net/projects/congruity/"
SRC_URI="mirror://sourceforge/${PN}/${PV}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	$(python_gen_cond_dep '
		dev-python/wxpython[${PYTHON_USEDEP}]
		dev-python/suds[${PYTHON_USEDEP}]
		dev-libs/libconcord[python,${PYTHON_USEDEP}]
	')
"
RDEPEND="${DEPEND}"

src_install() {
	distutils-r1_src_install

	dodoc README.txt Changelog
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}

python_install() {
	distutils-r1_python_install --skip-update-desktop-db
}
