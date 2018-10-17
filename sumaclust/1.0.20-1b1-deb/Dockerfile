FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sumaclust" \ 
    container="sumaclust" \ 
    about.summary="fast and exact clustering of genomic sequences" \ 
    about.home="http://metabarcoding.org/sumaclust" \ 
    software.version="1.0.20-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/sumaclust/copyright" \ 
    extra.binaries="/usr/bin/sumaclust" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sumaclust && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
