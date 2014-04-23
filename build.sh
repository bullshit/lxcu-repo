#!/bin/bash
PACKAGENAME="lxcu-repo"
MAINTAINER="Oskar Holowaty <me@oskarholowaty.com>"
VENDOR="LXCU Team <team@lxcu.org>"
VERSION="1.1-1"
URL="https://www.biglan.at/oskar/lxcu/"
LICENSE="GPLv3"
DESCRIPTION="Install lxcu repository"

ROOT=`pwd`

cd ./src
fpm -f -s dir -t deb -a all \
	-n "$PACKAGENAME" \
	-m "$MAINTAINER" \
	--vendor "$VENDOR" \
	--category "misc" \
	--license "$LICENSE" \
	--url $URL \
	--description "$DESCRIPTION" \
	--after-install "${ROOT}/debian/install_apt_key.sh" \
	--post-uninstall "${ROOT}/debian/uninstall_apt_key.sh" \
	-v "$VERSION" \
	-p "${ROOT}/lxcu-repo_${VERSION}_all.deb" \
	--config-files "/etc/apt/" \
	--deb-changelog "${ROOT}/debian/changelog" \
	--deb-compression "xz" \
	.
