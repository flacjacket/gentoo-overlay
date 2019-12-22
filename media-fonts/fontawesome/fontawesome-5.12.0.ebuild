# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

MY_PN="Font-Awesome-Pro"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="The iconic font"
HOMEPAGE="https://fontawesome.com"
SRC_URI="https://github.com/FortAwesome/Font-Awesome-Pro/archive/${PV}.tar.gz -> ${PN}-pro-${PV}.tar.gz"

LICENSE="CC-BY-3.0 OFL-1.1"
SLOT="0/5"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="+otf +ttf"

RESTRICT="fetch"
REQUIRED_USE="|| ( otf ttf )"

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/${MY_P}"

src_install() {
	if use otf; then
		FONT_S="${S}/otfs" FONT_SUFFIX="otf" font_src_install
	fi
	if use ttf; then
		FONT_S="${S}/webfonts" FONT_SUFFIX="ttf" font_src_install
	fi
}
