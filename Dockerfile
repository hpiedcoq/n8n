FROM n8nio/n8n:latest-debian
MAINTAINER openfacto <openfacto@openfacto.fr>

ENV DEBIAN_FRONTEND=noninteractive

ENV LANG fr_FR.utf8

WORKDIR /app

RUN apt update && \
    apt install --no-install-recommends -y build-essential \
    ca-certificates \
    apt-utils \
    bash \
    gcc \
    curl \
    npm

RUN apt install --no-install-recommends -y locales \
    wget \
    grep \
    whois \
    python3 \
    python3-pip \
    python3-dev \
    python3-setuptools\
    dnsutils \
    geoip-bin \
    jq \
    psmisc \
    ntp \
    netbase \
    git \
    tor \
    torsocks && \
    localedef -i fr_FR -c -f UTF-8 -A /usr/share/locale/locale.alias fr_FR.UTF-8


RUN pip3 install --upgrade pip && \
    pip3 install jc && \
    pip3 install shodan && \
    pip3 install trafilatura && \
    pip3 install setuptools_rust

RUN git clone https://github.com/megadose/toutatis.git && \
    python3 toutatis/setup.py install


RUN git clone https://github.com/h51un6/email2github.git && \
    pip3 install -r email2github/requirements.txt && \
    mkdir email2github/tmp

COPY tmp/auth.json email2github/tmp/auth.json 


COPY torrc /etc/tor/torrc
COPY torsocks.conf /etc/tor/torsocks.conf
COPY tor.sh /app/tor.sh

RUN chmod +x /app/tor.sh

EXPOSE 5678

ENTRYPOINT ["/app/tor.sh", "&"]