# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A Multipurpose Open Source OSD"
HOMEPAGE="http://www.mwosd.com/"
SRC_URI="https://github.com/ShikOfTheRa/scarab-osd/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/scarab-osd-${PV}"

src_install() {
	local dest_gui="/opt/${PN}-gui-${PV}" dest="/opt/MW_OSD"

	insinto "${dest}"
	doins MW_OSD/{Credits.txt,Def.h,fontD.h,fontL.h,GlobalVariables.h,GPS.ino,Max7456.ino,MW_OSD.ino,Screen.ino,Serial.ino,symbols.h}

	cd MW_OSD_GUI/application.linux64 || die
	insinto "${dest_gui}"
	doins -r "data" "lib" "source"
	exeinto "${dest_gui}"
	doexe "MW_OSD_GUI"

	exeinto "/opt/bin"
	doexe "${FILESDIR}/mwosd-gui"

	# Make sure write permissions are ok on everything
	insopts -o root -g users -m 0664
	# Also need write access to hudlayout.xml and gui.cfg
	insinto "${dest_gui}/data"
	doins "data/hudlayout.xml"
	doins "${FILESDIR}/gui.cfg"

	# Give write access to Config.h
	insinto "${dest}"
	cd ../..
	doins MW_OSD/Config.h
}
