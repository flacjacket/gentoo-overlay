# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

if [ "${ARCH}" = "amd64" ] ; then
	LNXARCH="linux-x86_64"
else
	LNXARCH="linux-i686"
fi
MY_PN="Zotero"
MY_P="${MY_PN}-${PV}"

inherit eutils

DESCRIPTION="Zotero [zoh-TAIR-oh] is a free, easy-to-use tool to help you collect, organize, cite, and share your research sources."
HOMEPAGE="https://www.zotero.org/"
SRC_URI="
	amd64? ( "https://download.zotero.org/client/release/${PV}/${MY_P}_linux-x86_64.tar.bz2" )
	x86? ( "https://download.zotero.org/client/release/${PV}/${MY_P}_linux-i686.tar.bz2" )
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
RESTRICT="mirror strip"

RDEPEND=""

S="${WORKDIR}/${MY_PN}_${LNXARCH}"

ZOTERO_INSTALL_DIR="/opt/${PN}"

src_install() {

	# install zotero files to /opt/zotero
	dodir ${ZOTERO_INSTALL_DIR}
	cp -a ${S}/. ${D}${ZOTERO_INSTALL_DIR} || die "Installing files failed"

	# install zotero-start.sh in /opt/zotero
	touch $D${ZOTERO_INSTALL_DIR}/zotero-start.sh

	# give it some instructions to start zotero
	echo "#!/bin/sh" >> $D${ZOTERO_INSTALL_DIR}/zotero-start.sh
	echo "exec "/opt/zotero/zotero"" >>  $D${ZOTERO_INSTALL_DIR}/zotero-start.sh

	# make zotero-start.sh executable
	fperms +x ${ZOTERO_INSTALL_DIR}/zotero-start.sh

	# sym link /opt/zotero/zotero-start.sh to /opt/bin/zotero
	dosym ${ZOTERO_INSTALL_DIR}/zotero-start.sh /opt/bin/zotero

	newicon -s 48 chrome/icons/default/default48.png zotero.png
	newicon chrome/icons/default/default48.png zotero.png
	newicon -s 32 chrome/icons/default/default32.png zotero.png
	newicon -s 16 chrome/icons/default/default16.png zotero.png
	make_desktop_entry "/opt/bin/zotero" Zotero zotero Science
}

