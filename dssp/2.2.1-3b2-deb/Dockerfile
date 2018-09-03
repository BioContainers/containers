FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dssp" \ 
    container="dssp" \ 
    about.summary="protein secondary structure assignment based on 3D structure" \ 
    about.home="http://www.cmbi.ru.nl/dssp.html" \ 
    software.version="2.2.1-3b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/dssp/copyright" \ 
    extra.binaries="/usr/bin/dssp,/usr/bin/mkdssp" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dssp && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
