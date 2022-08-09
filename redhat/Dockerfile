FROM fedora:latest

RUN yum -y install git rpm-build rpmdevtools
RUN yum -y install python3 python3-pip
RUN pip3 install bump2version

WORKDIR /src
RUN mkdir -p /root/rpmbuild/SPECS/
RUN mkdir -p /root/rpmbuild/SOURCES/
COPY reactwebui.spec /root/rpmbuild/SPECS/
RUN mkdir -p /src
COPY make_react_webui_rpm.sh /src
