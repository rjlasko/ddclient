#!/bin/sh
set -xueo pipefail


# Install applications to support compilation + build of DDClient
mkdir -p /tmp/bin


# Install DDClient
apk add --update --no-cache curl bzip2
curl -L https://sourceforge.net/projects/ddclient/files/ddclient/ddclient-${DDCLIENT_VERSION}/ddclient-${DDCLIENT_VERSION}.tar.bz2/download | tar jx -C /tmp/bin
cp /tmp/bin/ddclient-${DDCLIENT_VERSION}/ddclient /usr/bin/

mkdir -p /var/cache/ddclient
mkdir -p /etc/ddclient
# and then the mounted ddclient.conf file needs to be mounted to this location
#cp /etc/ddclient.conf /etc/ddclient/ddclient.conf


# TODO: add perl-io-socket-ssl
apk add --update --no-cache perl perl-io-socket-ssl

apk del curl bzip2
