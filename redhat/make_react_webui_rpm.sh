#!/bin/sh

cd /tmp/ || exit

DIST_DIR=$(mktemp -d /tmp/dist.XXX)
SCRATCH_DIR=$(mktemp -d /tmp/source.XXX)

HTML_DIR="${DIST_DIR}/var/www/html"
WEBDATA_DIR="${DIST_DIR}/var/local/WebData"

LGN_DIST="${SCRATCH_DIR}/sbphplogin-reactapp-main"
TPL_DIST="${SCRATCH_DIR}/streambox-templates-app"

if [ ! -d "${TPL_DIST}" ]; then
    git clone --depth 1 https://github.com/djklu31/streambox-templates-app "${TPL_DIST}"
fi

if [ ! -d "${LGN_DIST}" ]; then
    git clone --depth 1 https://github.com/djklu31/sbphplogin-reactapp.git "${LGN_DIST}"
fi

mkdir -p "${WEBDATA_DIR}/templates/"
mkdir -p "${HTML_DIR}/sbuiapp/"
mkdir -p "${HTML_DIR}/assets/"
mkdir -p "${HTML_DIR}/sbuiauth/"
mkdir -p "${HTML_DIR}/images/"

cp "${LGN_DIST}/"*                 "${HTML_DIR}/sbuiauth/"
cp "${TPL_DIST}/dist/templates/"*  "${WEBDATA_DIR}/templates/"
cp "${TPL_DIST}/public/images/"*   "${HTML_DIR}/images/"
cp "${TPL_DIST}/dist/assets/"*     "${HTML_DIR}/assets/"
cp "${TPL_DIST}/dist/index.html"   "${HTML_DIR}/sbuiapp/"

cd "${DIST_DIR}" || exit

tar cfz ~/rpmbuild/SOURCES/streambox-react-webui.tgz ./*

if [ -e ~/rpmbuild/SPECS/reactwebui.spec ]; then
    rpmbuild -bb ~/rpmbuild/SPECS/reactwebui.spec
else
    echo "SPEC file not exists"
fi

find /root/rpmbuild/RPMS -type f -iname '*.rpm' -exec cp {} /dist \;
