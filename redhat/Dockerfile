FROM centos:7

WORKDIR /src

RUN yum -y install \
  bash \
  coreutils \
  diffutils \
  gcc \
  git \
  make \
  patch \
  python3 \
  python3-pip \
  rpm-build \
  rpm-devel \
  rpmdevtools \
  rpmlint
RUN pip3 install bump2version

RUN rpmdev-setuptree

RUN mkdir -p /root/rpmbuild/{SOURCES,SPECS}/
COPY reactwebui.spec /root/rpmbuild/SPECS/

COPY test.sh /src
COPY make_react_webui_rpm.sh /src
