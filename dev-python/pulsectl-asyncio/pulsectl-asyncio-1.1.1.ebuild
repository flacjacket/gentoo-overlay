# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1 pypi

DESCRIPTION="Asyncio frontend for pulsectl, a Python bindings library for PulseAudio"
HOMEPAGE="
	https://pypi.org/project/pulsectl-asyncio/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/pulsectl-23.5.0[${PYTHON_USEDEP}]"
BDEPEND=""

distutils_enable_tests pytest
