# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

DESCRIPTION="implements the Host (PC) side of the USB DFU (Device Firmware Upgrade) protocol"
HOMEPAGE="http://wiki.openmoko.org/wiki/Dfu-util"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="virtual/libusb:1"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	eapply_user

	if [[ ${PV} == "9999" ]] ; then
		git-2_src_prepare
		eautoreconf
	fi
	sed -i '/^bin_PROGRAMS/s:dfu-util_static[^ ]*::' src/Makefile.in || die
}

src_install() {
	emake DESTDIR="${D}" install || die
	dodoc ChangeLog README TODO
}
