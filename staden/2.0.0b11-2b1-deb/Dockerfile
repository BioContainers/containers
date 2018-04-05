FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="staden" \ 
    container="staden" \ 
    about.summary="DNA sequence assembly (Gap4/Gap5), editing and analysis tools" \ 
    about.home="https://staden.sf.net" \ 
    software.version="2.0.0b11-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/staden/copyright" \ 
    extra.binaries="/usr/bin/gap4,/usr/bin/gap5,/usr/bin/pregap4,/usr/bin/staden,/usr/bin/trev" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y staden && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
