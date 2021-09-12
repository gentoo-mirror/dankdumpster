# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN=${PN/-bin/}

inherit desktop linux-info pax-utils unpacker xdg

DESCRIPTION="A second brain,
for you, forever."
HOMEPAGE="https://obsidian.md/"
SRC_URI="https://github.com/obsidianmd/obsidian-releases/releases/download/v0.12.15/${MY_PN}_${PV}_amd64.deb"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror bindist"

RDEPEND="
	app-crypt/libsecret
	dev-libs/libappindicator
	dev-libs/nss
	gui-libs/gtk
	sys-apps/util-linux
	x11-libs/libnotify
	x11-base/xorg-x11
	x11-libs/libXtst
	x11-misc/xdg-utils
"

S="${WORKDIR}"

QA_PREBUILT="
	opt/Obsidian/${MY_BIN}
	opt/Obsidian/chrome-sandbox
	opt/Obsidian/libffmpeg.so
	opt/Obsidian/libvk_swiftshader.so
	opt/Obsidian/libvulkan.so
	opt/Obsidian/libEGL.so
	opt/Obsidian/libGLESv2.so
	opt/Obsidian/libVkICD_mock_icd.so
	opt/Obsidian/swiftshader/libEGL.so
	opt/Obsidian/swiftshader/libGLESv2.so
	opt/Obsidian/swiftshader/libvk_swiftshader.so
"

CONFIG_CHECK="~USER_NS"

src_prepare() {
	default

	sed -i \
		-e "s:/usr/share/applications/${MY_PN}:/opt/Obsidian/${MY_PN}:g" \
		usr/share/applications/${MY_PN}.desktop || die
}

src_install() {
	newicon usr/share/icons/hicolor/512x512/apps/${MY_PN}.png ${MY_PN}.png
	domenu usr/share/applications/${MY_PN}.desktop

	insinto /opt/Obsidian
	doins -r opt/Obsidian/.
	fperms +x /opt/Obsidian/${MY_PN}
	dosym ../../opt/Obsidian/${MY_PN} usr/bin/${MY_PN}

	pax-mark -m "${ED}"/opt/Obsidian/${MY_PN}
}
