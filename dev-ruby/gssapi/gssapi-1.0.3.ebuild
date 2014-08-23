# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
#RUBY_FAKEGEM_RECIPE_TEST=""
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem

DESCRIPTION="A FFI wrapper around the system GSSAPI library"
HOMEPAGE="http://rubygems.org/gems/gssapi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0.1"
