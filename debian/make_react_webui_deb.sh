#!/bin/sh

cd /tmp/ || exit

DIST_DIR=$(mktemp -d)
TPL_DIST=streambox-templates-app-master
LGN_DIST=sbphplogin-reactapp-main

if [ ! -e react-deb-ctl.tgz ]; then
    echo "ERR: no DEB-control archive file found"
    exit
fi

tar -x -z -f react-deb-ctl.tgz -C "${DIST_DIR}"

#git clone https://github.com/djklu31/streambox-templates-app.git /tmp/streambox-templates-app
#git clone https://github.com/djklu31/sbphplogin-reactapp.git /tmp/sbphplogin-reactapp

#if false; then
curl -sLo sb-tpl-app.zip https://github.com/djklu31/streambox-templates-app/archive/refs/heads/master.zip
curl -sLo sb-login-app.zip https://github.com/djklu31/sbphplogin-reactapp/archive/refs/heads/master.zip
#fi

unzip sb-tpl-app.zip
unzip sb-login-app.zip

## automtatic VERSION insertion
if [ -e "${TPL_DIST}/CUR_VERSION.txt" ]; then
    CUR_VER="$(cat ${TPL_DIST}/CUR_VERSION.txt)"
    if [ -n "$CUR_VER" ]; then
        perl -pi -e "s/0.0.0/${CUR_VER}/" "${DIST_DIR}"/DEBIAN/control
    fi
fi

for i in "${TPL_DIST}/dist/templates/"*; do
    CF="$(basename "$i")"
    echo "/var/local/WebData/templates/${CF}" >>"${DIST_DIR}/DEBIAN/conffiles"
done

mkdir -p "${DIST_DIR}/var/www/images/"
mkdir -p "${DIST_DIR}/var/www/assets/"
mkdir -p "${DIST_DIR}/var/www/sbuiapp/"
mkdir -p "${DIST_DIR}/var/www/sbuiauth/"
mkdir -p "${DIST_DIR}/var/local/WebData/templates/"

chown www-data "${DIST_DIR}/var/local/WebData/templates/"

cp "${TPL_DIST}/dist/images/"*    "${DIST_DIR}/var/www/images/"
cp "${TPL_DIST}/dist/assets/"*    "${DIST_DIR}/var/www/assets/"
cp "${TPL_DIST}/dist/index.html"  "${DIST_DIR}/var/www/sbuiapp/"
cp "${LGN_DIST}/"*                "${DIST_DIR}/var/www/sbuiauth/"
cp "${TPL_DIST}/dist/templates/"* "${DIST_DIR}/var/local/WebData/templates/"

dpkg -b "${DIST_DIR}" .

rm -r "${TPL_DIST}"
rm -r "${LGN_DIST}"
rm -r "${DIST_DIR}"
rm sb-tpl-app.zip
rm sb-login-app.zip
