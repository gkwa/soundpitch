#!/bin/sh

cd /tmp/ || exit

DIST_DIR=$(mktemp -d)
TMPDIR=$(mktemp -d)
HTMLDIR=${TMPDIR}/
LGN_DIST="${DIST_DIR}"/sbphplogin-reactapp-main
TPL_DIST="${DIST_DIR}"/streambox-templates-app

if [ ! -d "${TMP_GIT_REP}" ]; then
    git clone --depth 1 https://github.com/djklu31/streambox-templates-app "${TPL_DIST}"
fi

if [ ! -d "${TMP_LGN_DIST}" ]; then
    git clone --depth 1 https://github.com/djklu31/sbphplogin-reactapp.git "${LGN_DIST}"
fi

if [ ! -e "${HTMLDIR}" ]; then
    mkdir -p "${HTMLDIR}"
fi

mkdir -p "${DIST_DIR}"/var/www/html/sbuiauth/
cp "${LGN_DIST}"/* "${DIST_DIR}"/var/www/html/sbuiauth/

cp -pr ${TMP_GIT_REP}/dist/images "${HTMLDIR}"
cp -pr ${TMP_GIT_REP}/dist/assets "${HTMLDIR}"
#cp -p ${TMP_GIT_REP}/dist/index.html "${HTMLDIR}/index.react.html"

cd "${HTMLDIR}" || exit
tar cvfz ~/rpmbuild/SOURCES/streambox-react-webui.tgz ./*

cd /tmp/ || exit

if [ -d "${TMPDIR}" ]; then
    rm -rf "${TMPDIR}"
fi

if [ -e ~/rpmbuild/SPECS/reactwebui.spec ]; then
    rpmbuild -bb ~/rpmbuild/SPECS/reactwebui.spec
else
    echo "SPEC file not exists"
fi

find /root/rpmbuild/RPMS -type f -iname '*.rpm' -exec cp {} /dist \;
