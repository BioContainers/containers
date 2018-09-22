FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="piler" \ 
    container="piler" \ 
    about.summary="genomic repeat analysis" \ 
    about.home="http://www.drive5.com/piler/" \ 
    software.version="020140707-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/piler/copyright" \ 
    extra.binaries="/usr/bin/piler2" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y piler && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
