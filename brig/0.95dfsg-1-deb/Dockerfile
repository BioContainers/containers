FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="brig" \ 
    container="brig" \ 
    about.summary="BLAST Ring Image Generator" \ 
    about.home="http://sourceforge.net/projects/brig/" \ 
    software.version="0.95dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="brig" \ 
    about.copyright="2010-2012 Nabil Alikhan" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/brig/copyright" \ 
    extra.binaries="/usr/bin/brig" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y brig && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
