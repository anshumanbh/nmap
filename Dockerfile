FROM alpine:latest

MAINTAINER Anshuman Bhartiya

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
    linux-headers \
    libpcap-dev \
&& apk add --no-cache openssl-dev \
&& rm -rf /var/cache/apk/*

RUN mkdir /nmap
WORKDIR /nmap

ADD . .

RUN ./configure \
    && make \
    && make install

ENTRYPOINT ["nmap"]
