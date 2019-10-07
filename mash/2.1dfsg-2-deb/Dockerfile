FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mash" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mash" \ 
    about.summary="fast genome and metagenome distance estimation using MinHash" \ 
    about.home="https://mash.readthedocs.io" \ 
    software.version="2.1dfsg-2-deb" \ 
    upstream.version="2.1" \ 
    version="1" \ 
    extra.identifiers.biotools="mash" \ 
    about.copyright=" 2015 Battelle National Biodefense Institute (BNBI)" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/mash/copyright" \ 
    extra.binaries="/usr/bin/mash" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mash || apt-get install -y mash) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
