FROM alpine:latest

MAINTAINER Anshuman Bhartiya

RUN apk update \
    && apk add build-base \
    && apk add linux-headers \
    && rm -rf /var/cache/apk/*

RUN mkdir /nmap
WORKDIR /nmap

ADD . .

RUN ./configure \
    && make \
    && make install

ENTRYPOINT ["nmap"]
