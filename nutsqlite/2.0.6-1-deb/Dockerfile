FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="nutsqlite" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="nutsqlite" \ 
    about.summary="Dietary nutrition analysis software" \ 
    about.home="http://nut.sourceforge.net/" \ 
    software.version="2.0.6-1-deb" \ 
    upstream.version="2.0.6" \ 
    version="1" \ 
    about.copyright="(C) Jim Jozwiak" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/nutsqlite/copyright" \ 
    extra.binaries="/usr/bin/nut,/usr/bin/update-nut" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y nutsqlite || apt-get install -y nutsqlite) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
