FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="smrtanalysis" \ 
    container="smrtanalysis" \ 
    about.summary="software suite for single molecule, real-time sequencing" \ 
    about.home="http://www.pacb.com/products-and-services/analytical-software/smrt-analysis/" \ 
    software.version="020161126-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/smrtanalysis/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y smrtanalysis && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
