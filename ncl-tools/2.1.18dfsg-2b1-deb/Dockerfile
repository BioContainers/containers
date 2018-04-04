FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncl-tools" \ 
    container="ncl-tools" \ 
    about.summary="tools to deal with NEXUS files" \ 
    about.home="http://sourceforge.net/projects/ncl/" \ 
    software.version="2.1.18dfsg-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/ncl-tools/copyright" \ 
    extra.binaries="/usr/bin/NCLconverter,/usr/bin/NEXUSnormalizer,/usr/bin/NEXUSvalidator" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ncl-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
