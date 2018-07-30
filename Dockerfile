FROM arm32v6/alpine
LABEL maintainer="Jason Wilder <mail@jasonwilder.com>"

ENV VERSION 0.7.4
ENV DOWNLOAD_URL https://github.com/jwilder/docker-gen/releases/download/$VERSION/docker-gen-alpine-linux-armhf-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN apk --update add openssl \
    && wget $DOWNLOAD_URL -qO - | tar xvz -C /usr/local/bin \
    && apk del wget tar \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/docker-gen"]
