# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

MY_PV=${PV/_rc/rc}
MY_P=${PN}-${MY_PV}

DESCRIPTION="WiFi tools for linux"
HOMEPAGE="https://github.com/rockymeza/wifi"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/pbkdf2[${PYTHON_USEDEP}]
	net-wireless/wireless-tools"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
