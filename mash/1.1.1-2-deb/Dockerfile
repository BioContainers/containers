FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mash" \ 
    container="mash" \ 
    about.summary="fast genome and metagenome distance estimation using MinHash" \ 
    about.home="https://mash.readthedocs.io" \ 
    software.version="1.1.1-2-deb" \ 
    version="1" \ 
    about.copyright=" 2015 Battelle National Biodefense Institute (BNBI)" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/mash/copyright" \ 
    extra.binaries="/usr/bin/mash" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mash && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
