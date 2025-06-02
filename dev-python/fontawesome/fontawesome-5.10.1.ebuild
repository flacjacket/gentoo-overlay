# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="The Font Awesome icon set for python"
HOMEPAGE="https://pypi.org/project/fontawesome/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.post1.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${P}.post1"

PATCHES=(
	"${FILESDIR}"/${PN}-pypandoc.patch
)

RDEPEND=""
BDEPEND="
	dev-python/pyyaml[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
