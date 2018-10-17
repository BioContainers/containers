FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="indelible" \ 
    container="indelible" \ 
    about.summary="powerful and flexible simulator of biological evolution" \ 
    about.home="http://abacus.gene.ucl.ac.uk/software/indelible/" \ 
    software.version="1.03-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/indelible/copyright" \ 
    extra.binaries="/usr/bin/indelible" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y indelible && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
