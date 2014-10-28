# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools multilib

CODENAME="Gotham"
MY_PV="${PV/_p*}-${CODENAME}"
MY_P="${PN}-${MY_PV}"
S=${WORKDIR}/${MY_P}

DESCRIPTION="XBMC addon: add VDR (http://www.cadsoft.de/vdr) as a TV/PVR Backend"
HOMEPAGE="https://github.com/opdenkamp/xbmc-pvr-addons"
SRC_URI="https://github.com/opdenkamp/xbmc-pvr-addons/archive/${MY_PV}.tar.gz"

KEYWORDS="~amd64 ~arm ~x86"
LICENSE="GPL-2"
SLOT="0"
IUSE="+mythtv"

RDEPEND="
	mythtv? ( media-tv/mythtv )
"

DEPEND="${RDEPEND}
	mythtv? ( dev-libs/boost )"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf --prefix=/usr \
		--libdir=/usr/share/xbmc/addons \
		--datadir=/usr/share/xbmc/addons \
		$(use_enable mythtv addons-with-dependencies)
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
