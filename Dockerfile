FROM ghcr.io/linuxserver/baseimage-ubuntu:bionic

RUN --mount=source=deb,target=/deb apt-get update \
 && ( dpkg -i /deb/deluged*.deb /deb/deluge-console*.deb /deb/deluge-web*.deb || true ) \
 && DEBIAN_FRONTEND=noninteractive apt-get -fy install \
 && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY linuxserver/root/ /

ENV PYTHON_EGG_CACHE=/config/plugins/.python-eggs
EXPOSE 8112 58846 58946 58946/udp
VOLUME /config /downloads
