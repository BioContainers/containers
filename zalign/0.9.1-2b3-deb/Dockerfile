FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="zalign" \ 
    container="zalign" \ 
    about.summary="parallel local alignment of biological sequences" \ 
    about.home="https://launchpad.net/zalign" \ 
    software.version="0.9.1-2b3-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/zalign/copyright" \ 
    extra.binaries="/usr/bin/mpialign,/usr/bin/zalign" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y zalign && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
