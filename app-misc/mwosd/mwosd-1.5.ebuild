# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="A Multipurpose Open Source OSD"
HOMEPAGE="http://www.mwosd.com/"
SRC_URI="https://github.com/ShikOfTheRa/scarab-osd/archive/R${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/scarab-osd-R1.5"

src_install() {
	local dest_gui="/opt/${PN}-gui-${PV}" dest="/opt/MW_OSD"

	cd MW_OSD
	insinto "${dest}"
	doins Config.h Credits.txt Def.h fontD.h fontL.h GlobalVariables.h GPS.ino Max7456.ino MW_OSD.ino Screen.ino Serial.ino symbols.h

	cd ../MW_OSD_GUI/application.linux64 || die
	insinto "${dest_gui}"
	doins -r "data" "lib" "source"
	exeinto "${dest_gui}"
	doexe "MW_OSD_GUI"

	exeinto "/opt/bin"
	doexe "${FILESDIR}/mwosd-gui"

	# Make sure permissions are ok on everything
	# Need write access to ./data (to add gui.cfg)
	diropts -o root -g users -m 775
	dodir "${dest_gui}/data"

	# Also need write access to hudlayout.xml
	insinto "${dest_gui}/data"
	insopts -o root -g users -m 664
	doins "data/hudlayout.xml"
}
