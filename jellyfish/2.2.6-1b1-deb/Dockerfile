FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="jellyfish" \ 
    container="jellyfish" \ 
    about.summary="count k-mers in DNA sequences" \ 
    about.home="http://www.cbcb.umd.edu/software/jellyfish/" \ 
    software.version="2.2.6-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/jellyfish/copyright" \ 
    extra.binaries="/usr/bin/jellyfish" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y jellyfish && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
