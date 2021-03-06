# Copyright 1999-2020 Graveyard Overlay Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby20"
RUBY_FAKEGEM_DOCDIR="rdoc"
inherit ruby-fakegem

DESCRIPTION="Gorillib is a lightweight subset of ruby convenience methods"
HOMEPAGE="https://github.com/infochimps-labs/gorillib"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "dev-ruby/multi_json
	dev-ruby/json:0
	>=dev-ruby/configliere-0.4.18-r1"
