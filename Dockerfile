FROM alpine:3.8
MAINTAINER rjlasko

# XXX: Alpine needs to have tzdata installed prior to defining the TZ
# https://serverfault.com/questions/683605/docker-container-time-timezone-will-not-reflect-changes
RUN apk add --no-cache tzdata

ARG TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ARG DDCLIENT_VERSION="3.8.3"

COPY fsroot /
RUN /bin/sh /tmp/build.sh && \
	rm -rf /tmp/*

VOLUME /etc/ddclient/ddclient.conf

ENTRYPOINT ["/usr/bin/ddclient"]
