FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="smithwaterman" \ 
    container="smithwaterman" \ 
    about.summary="determine similar regions between two strings or genomic sequences" \ 
    about.home="https://github.com/ekg/smithwaterman" \ 
    software.version="0.020160702-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/smithwaterman/copyright" \ 
    extra.binaries="/usr/bin/smithwaterman" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y smithwaterman && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
