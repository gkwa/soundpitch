FROM centos:7

RUN yum -y install \
  git \
  rpm-build \
  rpmdevtools \
  python3 \
  python3-pip
RUN pip3 install bump2version

WORKDIR /src

RUN mkdir -p /root/rpmbuild/{SOURCES,SPECS}/
COPY reactwebui.spec /root/rpmbuild/SPECS/

RUN mkdir -p /src
COPY make_react_webui_rpm.sh /src
