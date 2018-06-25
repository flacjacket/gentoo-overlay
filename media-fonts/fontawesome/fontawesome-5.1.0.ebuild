# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

REPO_PN="Font-Awesome-Pro"

MY_P="${PN}-pro-${PV}"

DESCRIPTION="The iconic font"
HOMEPAGE="https://fontawesome.com"
SRC_URI="https://github.com/FortAwesome/${REPO_PN}/archive/${MY_P}-desktop.zip
		 https://github.com/FortAwesome/${REPO_PN}/archive/${MY_P}-web.zip"

LICENSE="CC-BY-3.0 OFL-1.1"
SLOT="0/5"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="+otf +ttf"

RESTRICT="fetch"
REQUIRED_USE="|| ( otf ttf )"

DEPEND="app-arch/unzip"
RDEPEND=""

S_BASE="${WORKDIR}/${MY_P}"
S="${S_BASE}-desktop"

src_install() {
	if use otf; then
		FONT_S="${S_BASE}-desktop/otfs" FONT_SUFFIX="otf" font_src_install
	fi
	if use ttf; then
		FONT_S="${S_BASE}-web/webfonts" FONT_SUFFIX="ttf" font_src_install
	fi
}
