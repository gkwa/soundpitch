from ubuntu:focal

WORKDIR /tmp

RUN apt-get update
RUN apt-get -y install curl unzip perl

COPY react-deb-ctl.tgz /tmp
COPY make_react_webui_deb.sh /tmp

CMD ["/usr/bin/sleep", "infinity"]
