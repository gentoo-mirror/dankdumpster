# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
adler-1.0.2
autocfg-1.0.1
bitflags-1.2.1
byteorder-1.4.3
bzip2-0.3.3
bzip2-0.4.2
bzip2-sys-0.1.10+1.0.8
cc-1.0.68
cfg-if-1.0.0
crc32fast-1.2.1
filetime-0.2.14
flate2-1.0.20
fuchsia-cprng-0.1.1
getrandom-0.2.3
libc-0.2.95
lzma-sys-0.1.17
miniz_oxide-0.4.4
ouch-0.1.5
pkg-config-0.3.19
ppv-lite86-0.2.10
proc-macro2-1.0.27
quote-1.0.9
rand-0.4.6
rand-0.8.3
rand_chacha-0.3.0
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.6.2
rdrand-0.4.0
redox_syscall-0.2.8
remove_dir_all-0.5.3
same-file-1.0.6
strsim-0.10.0
syn-1.0.72
tar-0.4.33
tempdir-0.3.7
thiserror-1.0.25
thiserror-impl-1.0.25
time-0.1.43
unicode-xid-0.2.2
walkdir-2.3.2
wasi-0.10.2+wasi-snapshot-preview1
winapi-0.3.9
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.5
winapi-x86_64-pc-windows-gnu-0.4.0
xattr-0.2.2
xz2-0.1.6
zip-0.5.12
"

inherit cargo

DESCRIPTION="A command-line utility for easily compressing and decompressing files and directories."
HOMEPAGE="https://github.com/vrmiguel/ouch"
SRC_URI="$(cargo_crate_uris ${CRATES})"
RESTRICT="mirror"
LICENSE="0BSD Apache-2.0 ISC MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
IUSE=""

DEPEND="app-arch/bzip2"
RDEPEND=""
