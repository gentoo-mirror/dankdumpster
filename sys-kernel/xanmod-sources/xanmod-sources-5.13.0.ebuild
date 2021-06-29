# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
ETYPE="sources"
K_WANT_GENPATCHES="base extras"
K_GENPATCHES_VER="1"
K_SECURITY_UNSUPPORTED="1"
K_NOSETEXTRAVERSION="1"

XAN_VER="${PV}-xanmod1"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
HOMEPAGE="https://github.com/xanmod"
IUSE=""

DESCRIPTION="The XanMod Kernel Live Sources"

XAN_URI="https://github.com/xanmod/linux/releases/download/${XAN_VER}/patch-${XAN_VER}.xz"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI} ${XAN_URI}"

UNIPATCH_LIST="${DISTDIR}/patch-${XAN_VER}.xz"
UNIPATCH_STRICTORDER="yes"

K_EXTRAEINFO="For more info on xanmod-sources, and for how to report problems, see: \
${HOMEPAGE}"

pkg_setup() {
	ewarn
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the xanmod developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn
	kernel-2_pkg_setup
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
