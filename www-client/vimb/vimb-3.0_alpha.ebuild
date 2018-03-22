# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit toolchain-funcs eutils

ECOMMIT="acf2820a51802d0bf5c22933e2611398c5293160"

DESCRIPTION="a fast, lightweight, vim-like browser based on webkit"
HOMEPAGE="http://fanglingsu.github.io/vimb/"
SRC_URI="https://github.com/fanglingsu/${PN}/archive/${ECOMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="mirror"

RDEPEND=">=net-libs/libsoup-2.38:2.4
	>=net-libs/webkit-gtk-2.4.0:3
	x11-libs/gtk+:3
	x11-libs/pango:0
	dev-libs/glib:2"
DEPEND="virtual/pkgconfig"

S="${WORKDIR}/${PN}-${ECOMMIT}"

src_prepare() {
	default

	# force verbose build
	sed -e '/@echo "\($(CC)\|${CC}\) $@"/d' \
		-e 's/@$(CC)/$(CC)/' \
		-i src/Makefile || die
}

src_compile() {
	local myconf=" GTK=3"
	emake CC="$(tc-getCC)" ${myconf}
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install
}
