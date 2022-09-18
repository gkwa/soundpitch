from ubuntu:focal

WORKDIR /tmp

RUN apt-get update
RUN apt-get -y install git curl unzip perl

COPY react-deb-ctl.tgz /tmp
COPY test.sh /tmp
COPY make_react_webui_deb.sh /tmp

CMD ["./make_react_webui_deb.sh"]
