# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
DISTUTILS_SINGLE_IMPL=1

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1

DESCRIPTION="Simple GUI tool to flash ESPs over USB"
HOMEPAGE="https://esphome.io/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	$(python_gen_cond_dep '
		dev-embedded/esptool[${PYTHON_SINGLE_USEDEP}]
		dev-python/wxpython[${PYTHON_MULTI_USEDEP}]
		dev-python/requests[${PYTHON_MULTI_USEDEP}]
	')
"
RDEPEND="${DEPEND}"
BDEPEND=""
