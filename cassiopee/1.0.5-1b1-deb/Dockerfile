FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cassiopee" \ 
    container="cassiopee" \ 
    about.summary="index and search tool in genomic sequences" \ 
    about.home="https://github.com/osallou/cassiopee-c" \ 
    software.version="1.0.5-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/cassiopee/copyright" \ 
    extra.binaries="/usr/bin/cassiopee,/usr/bin/cassiopeeknife" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y cassiopee && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
