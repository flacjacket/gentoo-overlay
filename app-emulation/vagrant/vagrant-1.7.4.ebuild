# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
USE_RUBY="ruby20"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_EXTRAINSTALL="contrib keys plugins templates version.txt"
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

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
	<=dev-ruby/bundler-1.10.5
	>=dev-ruby/childprocess-0.5.0
	<dev-ruby/childprocess-0.6
	<dev-ruby/erubis-2.8
	dev-ruby/i18n:0.6
	dev-ruby/listen:3
	>=dev-ruby/hashicorp-checkpoint-0.1.1
	<dev-ruby/hashicorp-checkpoint-0.2
	<dev-ruby/log4r-1.1.11
	<dev-ruby/net-ssh-2.10.0
	dev-ruby/net-sftp:2
	<dev-ruby/net-scp-1.2
	<dev-ruby/rest-client-2.0
	<dev-ruby/winrm-1.4
	<dev-ruby/winrm-fs-0.3
	=dev-ruby/nokogiri-1.6.3.1
"

ruby_add_bdepend "
	dev-ruby/rake
	test? ( dev-ruby/mocha virtual/ruby-minitest )
"

all_ruby_prepare() {
	sed -e '/"rb-kqueue"/d;/"wdm"/d' -i ${RUBY_FAKEGEM_GEMSPEC} || die
	sed -e 's/listener.stop if listener.state != :stopped/listener.stop if listener.listen?/' \
		-i plugins/synced_folders/rsync/command/rsync_auto.rb || die
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
