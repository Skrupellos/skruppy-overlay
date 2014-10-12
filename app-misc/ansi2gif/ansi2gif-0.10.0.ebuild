# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils

SLOT="0"

DESCRIPTION="A classical example to use when starting on something new."
HOMEPAGE="http://www.deater.net/weave/vmwprod/ansi2gif/"
SRC_URI="http://www.deater.net/weave/vmwprod/ansi2gif/ansi2gif-0.10.0.tar.gz"

LICENSE="MIT"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

src_prepare() {
	epatch "${FILESDIR}/${P}-gentoo.patch"
}

src_install() {
	emake DESTDIR="${D}" install
}