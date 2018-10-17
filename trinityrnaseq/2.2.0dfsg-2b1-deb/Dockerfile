FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="trinityrnaseq" \ 
    container="trinityrnaseq" \ 
    about.summary="RNA-Seq De novo Assembly" \ 
    about.home="http://trinityrnaseq.github.io/" \ 
    software.version="2.2.0dfsg-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/trinityrnaseq/copyright" \ 
    extra.binaries="/usr/bin/Trinity" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y trinityrnaseq && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
