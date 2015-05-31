# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC="yard"
#RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="This is a simple wrapper over the kqueue BSD event notification interface"
HOMEPAGE="http://rubygems.org/gems/rb-kqueue"

LICENSE="BSD"
SLOT="2"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-0.5.0"

ruby_add_bdepend "doc? ( dev-ruby/yard )"
