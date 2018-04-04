FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="filo" \ 
    container="filo" \ 
    about.summary="FILe and stream Operations" \ 
    about.home="https://github.com/arq5x/filo" \ 
    software.version="1.1.0-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/filo/copyright" \ 
    extra.binaries="/usr/bin/groupBy" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y filo && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
