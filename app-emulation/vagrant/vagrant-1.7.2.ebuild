# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
USE_RUBY="ruby20"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"
RUBY_FAKEGEM_EXTRAINSTALL="keys plugins templates version.txt"
RUBY_FAKEGEM_TASK_DOC=""

inherit ruby-fakegem

DESCRIPTION="A tool for building and distributing virtual machines using VirtualBox"
HOMEPAGE="http://vagrantup.com/"
SRC_URI="https://github.com/mitchellh/vagrant/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

# Missing ebuild for contest
RESTRICT="test"

RDEPEND="${RDEPEND}
	app-arch/libarchive
	net-misc/curl
	!x64-macos? ( || ( app-emulation/virtualbox app-emulation/virtualbox-bin ) )"

ruby_add_rdepend "
	<dev-ruby/bundler-1.8
	>=dev-ruby/childprocess-0.5.0
	<dev-ruby/childprocess-0.6
	<dev-ruby/erubis-2.8
	dev-ruby/i18n:0.6
	>=dev-ruby/listen-2.8:2
	>=dev-ruby/hashicorp-checkpoint-0.1.1
	<dev-ruby/hashicorp-checkpoint-0.2
	<dev-ruby/log4r-1.1.11
	<dev-ruby/net-ssh-2.10.0
	dev-ruby/net-sftp:2
	<dev-ruby/net-scp-1.2
	dev-ruby/rb-kqueue:2
	dev-ruby/rest-client
	=dev-ruby/wdm-0.1.0
	dev-ruby/winrm:1.1
	=dev-ruby/nokogiri-1.6.3.1
"

ruby_add_bdepend "
	dev-ruby/rake
	test? ( dev-ruby/mocha virtual/ruby-minitest )
"

all_ruby_prepare() {
	# remove bundler support ????
	sed -i '/[Bb]undler/d' Rakefile || die
	rm Gemfile || die

	epatch "${FILESDIR}"/${PN}-1.6.3-no-warning.patch
	epatch "${FILESDIR}"/${PN}-1.6.3-rvm.patch
}

pkg_postinst() {
	if use x64-macos ; then
		ewarn
		ewarn "For Mac OS X prefixes, you must install the virtualbox"
		ewarn "package specifically for OS X which can be found at:"
		ewarn "https://www.virtualbox.org/wiki/Downloads"
		ewarn
	fi
}
