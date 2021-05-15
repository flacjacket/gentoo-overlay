# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} pypy3 )

inherit distutils-r1

DESCRIPTION="Python bindings for the libwayland library"
HOMEPAGE="https://pywayland.readthedocs.io/en/latest/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	$(python_gen_cond_dep '>=dev-python/cffi-1.12.0:=[${PYTHON_USEDEP}]' 'python*')
	$(python_gen_cond_dep 'dev-python/dataclasses[${PYTHON_USEDEP}]' python3_6)"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]"
