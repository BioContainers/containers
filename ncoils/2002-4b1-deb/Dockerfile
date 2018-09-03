FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncoils" \ 
    container="ncoils" \ 
    about.summary="coiled coil secondary structure prediction" \ 
    about.home="http://www.russelllab.org/coils/" \ 
    software.version="2002-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/ncoils/copyright" \ 
    extra.binaries="/usr/bin/coils-wrap,/usr/bin/ncoils" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ncoils && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
