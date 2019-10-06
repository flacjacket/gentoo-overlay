# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Configuration tool for the Betaflight firmware"
HOMEPAGE="https://github.com/betaflight/betaflight-configurator"
SRC_URI="https://github.com/betaflight/${PN}/releases/download/${PV}/${PN}_${PV}_linux64.zip -> ${P}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
sys-apps/yarn"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/Betaflight Configurator"

src_compile() {
	:
}

src_install() {
	insinto /usr/share/${PN}
	doins -r *

	mkdir "${D}"/usr/bin/ || die
	ln -s /usr/share/${PN}/betaflight-configurator "${D}"/usr/bin/betaflight-configurator || die
	chmod +x "${D}"/usr/share/${PN}/betaflight-configurator || die
}
