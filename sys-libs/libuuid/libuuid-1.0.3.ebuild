# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit libtool

DESCRIPTION="Portable uuid C library"
HOMEPAGE="http://libuuid.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="!!sys-apps/util-linux
	!!sys-libs/native-uuid"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user
	elibtoolize
}

src_configure() {
	econf --disable-static
}

src_install() {
	default
	rm -f "${ED}"/usr/lib/*.la || die
}
