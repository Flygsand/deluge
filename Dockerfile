FROM ghcr.io/linuxserver/baseimage-ubuntu:bionic

RUN --mount=source=/deb,target=/deb apt-get update \
 && ( dpkg -i /deb/deluge-common*.deb /deb/deluged*.deb /deb/deluge-web* || true ) \
 && DEBIAN_FRONTEND=noninteractive apt-get -fy --no-install-recommends install \
 && DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install unzip unrar p7zip \
 && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY linuxserver/root/ /

ENV PYTHON_EGG_CACHE=/config/plugins/.python-eggs
EXPOSE 8112 58846 58946 58946/udp
VOLUME /config /downloads
