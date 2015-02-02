# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils systemd

DESCRIPTION="A tool to configure unbound with usable DNSSEC servers."
HOMEPAGE="http://www.nlnetlabs.nl/projects/dnssec-trigger/"
SRC_URI="http://www.nlnetlabs.nl/downloads/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+networkmanager"

COMMON_DEPEND="
	net-libs/ldns
	media-libs/harfbuzz
"
DEPEND="
	${COMMON_DEPEND}
"
RDEPEND="
	${COMMON_DEPEND}
	net-dns/unbound
"

src_prepare() {
	epatch "${FILESDIR}/${P}-gentoo.patch"
}

src_configure() {
	econf \
		--with-keydir=/etc/dnssec-trigger \
		--with-hooks=$(usex networkmanager networkmanager none)
}
