FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="transrate-tools" \ 
    container="transrate-tools" \ 
    about.summary="helper for transrate" \ 
    about.home="http://hibberdlab.com/transrate/" \ 
    software.version="1.0.0-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/transrate-tools/copyright" \ 
    extra.binaries="/usr/bin/bam-read" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y transrate-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
