# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} )
DISTUTILS_OPTIONAL=1
inherit distutils-r1 flag-o-matic

DESCRIPTION="Scalable, Portable and Distributed Gradient Boosting"
HOMEPAGE="https://xgboost.readthedocs.io/"
if [[ ${PV} == 9999* ]]; then
	EGIT_REPO_URI="https://github.com/dmlc/${PN}.git"
	inherit git-r3
else
	SRC_URI="http://github.com/dmlc/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="cpu_flags_x86_sse2 +python"

RDEPEND="python? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

src_prepare() {
	sed -e "s/CFLAGS=/CFLAGS+=/" \
		-e "s/-std=c++0x -Wall -O3 -msse2  -Wno-unknown-pragmas -funroll-loops/-std=c++11/" \
		-i Makefile
	eapply_user

	use cpu_flags_x86_sse2 && append-flags -msse2

	if use python; then
		cd python-package
		distutils-r1_src_prepare
	fi
}

src_compile() {
	emake

	if use python; then
		cd python-package
		distutils-r1_src_compile
	fi
}

src_install() {
	if use python; then
		cd python-package
		distutils-r1_src_install
	fi
}
