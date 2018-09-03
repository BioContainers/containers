FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hilive" \ 
    container="hilive" \ 
    about.summary="realtime alignment of Illumina reads" \ 
    about.home="https://sourceforge.net/projects/hilive/" \ 
    software.version="0.3-2-deb" \ 
    version="1" \ 
    about.copyright="2015 Martin S. Lindner <marzin@mail-lindner.de>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/hilive/copyright" \ 
    extra.binaries="/usr/bin/hilive,/usr/bin/hilive-build" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hilive && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
