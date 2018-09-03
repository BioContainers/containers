FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dawg" \ 
    container="dawg" \ 
    about.summary="program to simulate the evolution of recombinant DNA sequences" \ 
    about.home="http://scit.us/projects/dawg" \ 
    software.version="1.2-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/dawg/copyright" \ 
    extra.binaries="/usr/bin/dawg" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dawg && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
