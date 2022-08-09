docker-compose build
docker rm --force sbx-react-ui-c1
docker run --detach --name sbx-react-ui-c1 --rm -ti taylorm/sbx-react-ui
docker exec -ti sbx-react-ui-c1 bash -x /src/make_react_webui_rpm.sh
rm -rf /tmp/sbx-react-ui
docker cp sbx-react-ui-c1:/root/rpmbuild/RPMS/noarch/. /tmp/sbx-react-ui
find /tmp/sbx-react-ui
