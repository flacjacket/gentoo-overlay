# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="4"

inherit flag-o-matic toolchain-funcs eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://sourceware.org/git/newlib-cygwin.git"
	inherit git-r3
else
	SRC_URI="ftp://sourceware.org/pub/newlib/${P}.tar.gz"
#	if [[ ${PV} != *.201[5-9]???? ]] ; then
		KEYWORDS="-* arm ~hppa ~m68k ~mips ~ppc ~ppc64 ~sh ~sparc ~x86"
#	fi
fi

export CBUILD=${CBUILD:-${CHOST}}
export CTARGET=${CTARGET:-${CHOST}}
if [[ ${CTARGET} == ${CHOST} ]] ; then
	if [[ ${CATEGORY} == cross-* ]] ; then
		export CTARGET=${CATEGORY#cross-}
	fi
fi

DESCRIPTION="Newlib is a C library intended for use on embedded systems"
HOMEPAGE="http://sourceware.org/newlib/"

LICENSE="NEWLIB LIBGLOSS GPL-2"
SLOT="0"
IUSE="nls threads unicode crosscompile_opts_headers-only"
RESTRICT="strip"

NEWLIBBUILD="${WORKDIR}/build"
NANOLIBBUILD="${WORKDIR}/build-nano"

NEWLIBCONF=" --disable-newlib-supplied-syscalls
    --enable-newlib-io-long-long
    --enable-newlib-register-fini"
NANOCONF="--disable-newlib-supplied-syscalls
    --enable-newlib-reent-small
    --disable-newlib-fvwrite-in-streamio
    --disable-newlib-fseek-optimization
    --disable-newlib-wide-orient
    --enable-newlib-nano-malloc
    --disable-newlib-unbuf-stream-opt
    --enable-lite-exit
    --enable-newlib-global-atexit
    --enable-newlib-nano-formatted-io"

pkg_setup() {
	# Reject newlib-on-glibc type installs
	if [[ ${CTARGET} == ${CHOST} ]] ; then
		case ${CHOST} in
			*-newlib|*-elf) ;;
			*) die "Use sys-devel/crossdev to build a newlib toolchain" ;;
		esac
	fi
}

src_prepare() {
	epatch_user
}

src_configure() {
	# we should fix this ...
	unset LDFLAGS
	CHOST=${CTARGET} strip-unsupported-flags

	local myconf=""
	[[ ${CTARGET} == "spu" ]] \
		&& myconf="${myconf} --disable-newlib-multithread" \
		|| myconf="${myconf} $(use_enable threads newlib-multithread)"

	mkdir -p "${NEWLIBBUILD}"
	cd "${NEWLIBBUILD}"

	ECONF_SOURCE=${S} \
	econf \
		$(use_enable unicode newlib-mb) \
		$(use_enable nls) \
		${myconf} \
		${NEWLIBCONF}

	mkdir -p "${NANOLIBBUILD}"
	cd "${NANOLIBBUILD}"

	ECONF_SOURCE=${S} \
	econf \
		$(use_enable unicode newlib-mb) \
		$(use_enable nls) \
		${myconf} \
		${NANOCONF}
}

src_compile() {
	emake -C "${NEWLIBBUILD}"
	emake -C "${NANOLIBBUILD}"
}

src_install() {
	cd "${NANOLIBBUILD}"
	emake -j1 DESTDIR="${D}" install
	find "${D}" -regex ".*/lib\(c\|g\|rdimon\)\.a" -exec rename .a _nano.a '{}' \;

	cd "${NEWLIBBUILD}"
	emake -j1 DESTDIR="${D}" install
#	env -uRESTRICT CHOST=${CTARGET} prepallstrip
	# minor hack to keep things clean
	rm -fR "${D}"/usr/share/info
	rm -fR "${D}"/usr/info
}
