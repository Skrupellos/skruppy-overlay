# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-2 mozextension multilib

DESCRIPTION="Firefox addon, designed to make browsing more efficient and especially more keyboard accessible"
HOMEPAGE="http://5digits.org/pentadactyl/index"
EGIT_REPO_URI="git://github.com/5digits/dactyl.git"
S="${WORKDIR}"/src
MOZEXTENSION_TARGET="browser/extensions"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="|| (
		( >=www-client/firefox-3.6 )
		( >=www-client/firefox-bin-3.6 ) )"
DEPEND="${DEPEND}
	app-arch/zip"

RESTRICT="nomirror"

src_prepare() {
	## https://github.com/5digits/dactyl/issues/99#issuecomment-165550255
	sed -i "s|em:name=.*|em:name=\"Pentadactyl Nightly - Unofficial\"|" pentadactyl/install.rdf
	sed -i "s|em:version=.*|em:version=\"$(date -Iseconds)\"|"          pentadactyl/install.rdf
	#sed -i "s|em:id=\"penta.*|em:id=\"\"|"                              pentadactyl/install.rdf
	sed -i "s|em:maxVersion=.*|em:maxVersion=\"666.*\"/>|"              pentadactyl/install.rdf
}

src_compile() {
	emake -C "${PN}" xpi || die
}

src_install() {
	xpi_unpack "${WORKDIR}"/src/downloads/pentadactyl-* || die
	MOZILLA_FIVE_HOME=/usr/$(get_libdir)/firefox \
		xpi_install "${WORKDIR}"/pentadactyl-* || die
	dodoc AUTHORS Donors NEWS TODO || die
}
