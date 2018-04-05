FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="minia" \ 
    container="minia" \ 
    about.summary="short-read biological sequence assembler" \ 
    about.home="http://minia.genouest.org/" \ 
    software.version="1.6906-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/minia/copyright" \ 
    extra.binaries="/usr/bin/minia" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y minia && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
