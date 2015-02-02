# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils subversion systemd

DESCRIPTION="A tool to configure unbound with usable DNSSEC servers."
HOMEPAGE="http://www.nlnetlabs.nl/projects/dnssec-trigger/"
ESVN_REPO_URI="http://www.nlnetlabs.nl/svn/${PN}/trunk"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
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

src_configure() {
	econf \
		--with-keydir=/etc/dnssec-trigger \
		--with-hooks=$(usex networkmanager networkmanager none)
}
