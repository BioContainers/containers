FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="nast-ier" \ 
    container="nast-ier" \ 
    about.summary="NAST-based DNA alignment tool" \ 
    about.home="http://microbiomeutil.sourceforge.net/" \ 
    software.version="20101212dfsg1-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/nast-ier/copyright" \ 
    extra.binaries="/usr/bin/nast-ier" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y nast-ier && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
