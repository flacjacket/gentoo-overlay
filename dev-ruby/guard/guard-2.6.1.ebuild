# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
#RUBY_FAKEGEM_RECIPE_TEST=""

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Guard is a command line tool to easily handle events on file system modifications"
HOMEPAGE="http://rubygems.org/gems/guard"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend "
	>=dev-ruby/formatador-0.2.4
	=dev-ruby/listen-2*
	>=dev-ruby/listen-2.7
	=dev-ruby/lumberjack-1*
	>=dev-ruby/pry-0.9.12
	>=dev-ruby/thor-0.18.1
"
