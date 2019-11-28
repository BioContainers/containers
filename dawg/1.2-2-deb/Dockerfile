FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dawg" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dawg" \ 
    about.summary="simulate the evolution of recombinant DNA sequences" \ 
    about.home="https://github.com/reedacartwright/dawg" \ 
    software.version="1.2-2-deb" \ 
    upstream.version="1.2" \ 
    version="1" \ 
    about.copyright="2004-2009 Reed A. Cartwright" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/dawg/copyright" \ 
    extra.binaries="/usr/bin/dawg" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dawg || apt-get install -y dawg) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
