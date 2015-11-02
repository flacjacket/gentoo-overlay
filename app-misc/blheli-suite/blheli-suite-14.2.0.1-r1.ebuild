# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

BLHELI_FILE="BLHeliSuite${PV//./}.zip"
DL_URI="https://www.mediafire.com/folder/dx6kfaasyo24l/BLHeliSuite"

DESCRIPTION="BLHeli interface for SiLabs and BLHeli for Atmel based ESC"
HOMEPAGE="https://blhelisuite.wordpress.com/"
SRC_URI="${BLHELI_FILE}"

LICENSE="no-source-code"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="fetch"

DEPEND="app-emulation/wine"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

pkg_nofetch() {
	if [[ ! -f "${DISTDIR}/${BLHELI_FILE}" ]]; then
		einfo "Download ${BLHELI_FILE}"
		einfo "at '${DL_URI}'"
		einfo "and move it to '${DISTDIR}'"
	fi
}

src_install() {
	local dest="/opt/${P}"

	exeinto /usr/bin
	doexe "${FILESDIR}/blheli-suite"

	insinto "${dest}"
	doins "BLHeliAtmelHex.dll" "BLHeliSilabsHex.dll" "BLHeliSuite.exe" "SiUtil.dll" "USBHID.dll"

	doins -r "BLHeli_HexFiles" "Interfaces" "Manuals" "Screenshots" "SimonK_HexFiles"

	diropts -o root -g users -m 0775
	doins -r "Settings"

}

pkg_postinst() {
	local dest="/opt/${P}"
	export WINEPREFIX="/opt/${PN}-wineprefix"

	[[ -d "${WINEPREFIX}" ]] && chown root:root "${WINEPREFIX}" -R
	DISPLAY= regedit "${FILESDIR}/blheli-pdf-open.reg" 2> /dev/null || die

	# Setup com ports
	ln -sf /dev/ttyUSB0 "${WINEPREFIX}/dosdevices/com1"
	ln -sf /dev/ttyACM0 "${WINEPREFIX}/dosdevices/com2"

	[[ -d "${WINEPREFIX}/dosdevices/d:" ]] && rm "${WINEPREFIX}/dosdevices/d:"
	ln -sf ../../${P} "${WINEPREFIX}/dosdevices/d:"

	chown 1000:1000 "${WINEPREFIX}" -R
}
