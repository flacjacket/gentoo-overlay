# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

#RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRADOC="README.md"

inherit ruby-fakegem

DESCRIPTION="Windows Directory Monitor (WDM) is a threaded directories monitor for Windows."
HOMEPAGE="http://rubygems.org/gems/wdm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
