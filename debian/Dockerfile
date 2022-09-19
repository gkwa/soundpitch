from ubuntu:focal

WORKDIR /tmp

RUN apt-get update
RUN apt-get -y install git curl unzip perl tree

RUN curl -sLo /tmp/ripgrep.sh https://gist.githubusercontent.com/TaylorMonacelli/518fc257340d486a2b403b490f535bcf/raw/aa7dae078c0dad66f84349a491fea44ab6bb1a03/ripgrep_linux.sh
RUN bash /tmp/ripgrep.sh

COPY react-deb-ctl.tgz /tmp
COPY test.sh /tmp
COPY make_react_webui_deb.sh /tmp

CMD ["./make_react_webui_deb.sh"]
