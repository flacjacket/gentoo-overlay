# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Notification system for windows. Trying to be Growl. Ruby wrapper around notifu "
HOMEPAGE="http://rubygems.org/gems/rb-notifu"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

all_ruby_prepare() {
	# remove bundler support
	sed -i '/[Bb]undler/d' Rakefile || die
	#rm Gemfile || die
}
