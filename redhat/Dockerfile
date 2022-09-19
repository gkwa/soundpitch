FROM fedora

WORKDIR /src

RUN yum makecache
RUN yum -y install \
  bash \
  coreutils \
  curl \
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
  rpmlint \
  tito \
  tree
RUN pip3 install bump2version

RUN curl -sLo /tmp/ripgrep.sh https://gist.githubusercontent.com/TaylorMonacelli/518fc257340d486a2b403b490f535bcf/raw/aa7dae078c0dad66f84349a491fea44ab6bb1a03/ripgrep_linux.sh
RUN bash /tmp/ripgrep.sh

RUN rpmdev-setuptree

RUN mkdir -p /root/rpmbuild/{SOURCES,SPECS}/
COPY reactwebui.spec /root/rpmbuild/SPECS/

COPY test.sh /src
COPY make_react_webui_rpm.sh /src
