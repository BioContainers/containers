FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ray" \ 
    container="ray" \ 
    about.summary="de novo genome assemblies of next-gen sequencing data" \ 
    about.home="http://denovoassembler.sourceforge.net/" \ 
    software.version="2.3.1-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/ray/copyright" \ 
    extra.binaries="/usr/bin/Ray" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ray && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
