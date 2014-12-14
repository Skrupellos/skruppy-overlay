# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="manage ssh and GPG keys in a convenient and secure manner. Frontend for ssh-agent/ssh-add"
HOMEPAGE="http://www.funtoo.org/Package:Keychain"
SRC_URI="http://build.funtoo.org/distfiles/keychain/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash || ( net-misc/openssh net-misc/ssh )"


src_install() {
	dobin keychain
	doman keychain.1
	dodoc ChangeLog README.rst
}
