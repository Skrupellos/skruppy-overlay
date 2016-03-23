# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit qmake-utils

DESCRIPTION="Cut SVGs on Silhouette products: Cameo, Portrait and Craft Robo"
HOMEPAGE="http://robocut.org"
SRC_URI="https://github.com/Timmmm/robocut/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
	dev-qt/qtwidgets:5
	virtual/libusb
"
RDEPEND="${DEPEND}"
RESTRICT="download"

src_compile() {
	eqmake5 "PREFIX=/usr"
	emake
}

src_install() {
	emake INSTALL_ROOT="${D}" install
}
