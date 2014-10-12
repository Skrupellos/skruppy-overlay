# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit mercurial

SLOT="0"

DESCRIPTION="A generic, highly customizable, and efficient menu for the console (dmenu clone)"
HOMEPAGE="https://bitbucket.org/rafaelgg/slmenu/overview"
EHG_REPO_URI="https://bitbucket.org/rafaelgg/slmenu"

LICENSE="MIT"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}