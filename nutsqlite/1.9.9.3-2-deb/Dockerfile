FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="nutsqlite" \ 
    container="nutsqlite" \ 
    about.summary="Dietary nutrition analysis software" \ 
    about.home="http://nut.sourceforge.net/" \ 
    software.version="1.9.9.3-2-deb" \ 
    version="1" \ 
    about.copyright="(C) Jim Jozwiak" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/nutsqlite/copyright" \ 
    extra.binaries="/usr/bin/nut,/usr/bin/update-nut" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y nutsqlite && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
