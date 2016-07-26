# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby20"
inherit ruby-fakegem

DESCRIPTION="A library for manipulating and transforming HTML/XML documents and fragments"
HOMEPAGE="https://github.com/flavorjones/${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "dev-ruby/nokogiri"
