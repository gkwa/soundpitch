#!/bin/sh

TMP_GIT_REP=/tmp/streambox-templates-app
if [ ! -d "${TMP_GIT_REP}" ]; then
    git clone --depth 1 https://github.com/djklu31/streambox-templates-app "${TMP_GIT_REP}"
fi

TMPDIR=$(mktemp -d)
HTMLDIR=${TMPDIR}/

if [ ! -e "${HTMLDIR}" ]; then
    mkdir -p "${HTMLDIR}"
fi

if [ ! -e ~/rpmbuild ]; then
    rpmdev-setuptree
fi

cp -pr ${TMP_GIT_REP}/dist/images "${HTMLDIR}"
cp -pr ${TMP_GIT_REP}/dist/assets "${HTMLDIR}"
#cp -p ${TMP_GIT_REP}/dist/index.html "${HTMLDIR}/index.react.html"

cd "${HTMLDIR}" || exit
tar cvfz ~/rpmbuild/SOURCES/streambox-react-webui.tgz ./*

cd /tmp || exit

if [ -d "${TMPDIR}" ]; then
    rm -rf "${TMPDIR}"
fi

if [ -e ~/rpmbuild/SPECS/reactwebui.spec ]; then
    rpmbuild -bb ~/rpmbuild/SPECS/reactwebui.spec
else
    echo "SPEC file not exists"
fi

find /root/rpmbuild/RPMS -type f -exec cp {} /dist \;
