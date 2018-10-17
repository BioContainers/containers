FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="scrm" \ 
    container="scrm" \ 
    about.summary="simulator of evolution of genetic sequences" \ 
    about.home="https://github.com/scrm/scrm" \ 
    software.version="1.7.2-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/scrm/copyright" \ 
    extra.binaries="/usr/bin/scrm" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y scrm && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
