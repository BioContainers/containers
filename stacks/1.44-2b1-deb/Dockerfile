FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="stacks" \ 
    container="stacks" \ 
    about.summary="pipeline for building loci from short-read DNA sequences" \ 
    about.home="http://creskolab.uoregon.edu/stacks/" \ 
    software.version="1.44-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/stacks/copyright" \ 
    extra.binaries="/usr/bin/stacks" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y stacks && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
