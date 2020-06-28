# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} pypy3 )

inherit distutils-r1

DESCRIPTION="Bindings for libxkbcommon using cffi"
HOMEPAGE="https://github.com/sde1000/python-xkbcommon/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	$(python_gen_cond_dep '>=dev-python/cffi-1.5.0:=[${PYTHON_USEDEP}]' 'python*')"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]"
