from ubuntu:focal

WORKDIR /tmp

RUN apt-get update
RUN apt-get -y install curl unzip perl

COPY make_react_webui_deb.sh /tmp
COPY react-deb-ctl.tgz /tmp

CMD ["/usr/bin/sleep", "60" ]
