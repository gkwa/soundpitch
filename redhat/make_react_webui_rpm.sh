#!/bin/sh

cd /tmp/ || exit

DIST_DIR=$(mktemp -d)
SCRATCH_DIR=$(mktemp -d)
LGN_DIST="${SCRATCH_DIR}"/sbphplogin-reactapp-main
TPL_DIST="${SCRATCH_DIR}"/streambox-templates-app

if [ ! -d "${TMP_GIT_REP}" ]; then
    git clone --depth 1 https://github.com/djklu31/streambox-templates-app "${TPL_DIST}"
fi

if [ ! -d "${TMP_LGN_DIST}" ]; then
    git clone --depth 1 https://github.com/djklu31/sbphplogin-reactapp.git "${LGN_DIST}"
fi

mkdir -p "${DIST_DIR}"/var/www/html/images/
cp "${TPL_DIST}"/public/images/* "${DIST_DIR}"/var/www/html/images/

mkdir -p "${DIST_DIR}"/var/www/html/sbuiauth/
cp "${LGN_DIST}"/* "${DIST_DIR}"/var/www/html/sbuiauth/

mkdir -p "${DIST_DIR}"/var/www/html/assets/
cp "${TPL_DIST}"/dist/assets/* "${DIST_DIR}"/var/www/html/assets/

mkdir -p "${DIST_DIR}"/var/www/html/sbuiapp/
cp "${TPL_DIST}"/index.html "${DIST_DIR}"/var/www/html/sbuiapp/

# mkdir -p "${DIST_DIR}"/var/local/WebData/templates/
# cp "${TPL_DIST}"/public/templates/* "${DIST_DIR}"/var/local/WebData/templates/

cd "${DIST_DIR}" || exit

tar cvfz ~/rpmbuild/SOURCES/streambox-react-webui.tgz ./*

cd /tmp/ || exit

if [ -e ~/rpmbuild/SPECS/reactwebui.spec ]; then
    rpmbuild -bb ~/rpmbuild/SPECS/reactwebui.spec
else
    echo "SPEC file not exists"
fi

find /root/rpmbuild/RPMS -type f -iname '*.rpm' -exec cp {} /dist \;
