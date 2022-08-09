#!/bin/sh

TMP_GIT_REP=/tmp/streambox-templates-app

if [ ! -d ${TMP_GIT_REP} ]; then
    git clone https://github.com/djklu31/streambox-templates-app ${TMP_GIT_REP}
fi

#PWD0=$(pwd)
TMPDIR=$(mktemp -d)
HTMLDIR=${TMPDIR}/

# pushd .

if [ ! -e ${HTMLDIR} ]; then
	mkdir -p ${HTMLDIR}
fi

if [ ! -e ~/rpmbuild ]; then
	rpmdev-setuptree
fi

cp -pr ${TMP_GIT_REP}/dist/images     ${HTMLDIR}
cp -pr ${TMP_GIT_REP}/dist/assets     ${HTMLDIR}
cp -p  ${TMP_GIT_REP}/dist/index.html ${HTMLDIR}/index.react.html


cd ${HTMLDIR}
tar cvfz ~/rpmbuild/SOURCES/streambox-react-webui.tgz *


if [ -d "${TMPDIR}" ]; then
	rm -rf ${TMPDIR}
fi

cd ${PWD0}

if [ -e ~/rpmbuild/SPECS/reactwebui.spec ]; then
	rpmbuild -bb ~/rpmbuild/SPECS/reactwebui.spec
else
	echo "SPEC file not exists"
fi
