FROM fedora:latest

WORKDIR /src

RUN yum -y install git rpm-build rpmdevtools
RUN yum -y install python3 python3-pip
RUN pip3 install bump2version

RUN mkdir -p /root/rpmbuild/{SOURCES,SPECS}/

COPY reactwebui.spec /root/rpmbuild/SPECS/
COPY make_react_webui_rpm.sh /src

CMD ["/usr/bin/sleep", "infinity"]
