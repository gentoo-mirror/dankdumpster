# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Wrapper script for Steam custom launch options"
HOMEPAGE="https://github.com/frostworx/steamtinkerlaunch"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=app-shells/bash-5.0
	dev-vcs/git
	gnome-extra/yad
	sys-process/procps
	app-arch/unzip
	net-misc/wget
	sys-apps/which
	x11-misc/xdotool
	x11-apps/xprop
	x11-apps/xrandr
	x11-apps/xwininfo
	"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	emake PREFIX="${D}${EPREFIX}/usr" install
}
