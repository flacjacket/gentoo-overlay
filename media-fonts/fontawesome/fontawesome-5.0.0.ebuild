# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit font

REPO_PN="fontawesome-pro"

DESCRIPTION="The iconic font"
HOMEPAGE="http://fontawesome.io"
SRC_URI="${P}.zip"

LICENSE="CC-BY-3.0 OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE="+otf +ttf"

RESTRICT="fetch"
REQUIRED_USE="|| ( otf ttf )"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${REPO_PN}-${PV}"

FONT_SUFFIX=""

src_prepare() {
	eapply_user

	mv use-on-desktop/*.otf . || die
	mv web-fonts-with-css/webfonts/*.ttf . || die
}

src_configure() {
	use otf && FONT_SUFFIX+="otf "
	use ttf && FONT_SUFFIX+="ttf "
}
