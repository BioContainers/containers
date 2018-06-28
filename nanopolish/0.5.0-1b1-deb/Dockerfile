FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="nanopolish" \ 
    container="nanopolish" \ 
    about.summary="consensus caller for nanopore sequencing data" \ 
    about.home="https://github.com/jts/nanopolish" \ 
    software.version="0.5.0-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/nanopolish/copyright" \ 
    extra.binaries="/usr/bin/nanopolish" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y nanopolish && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
