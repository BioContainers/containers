FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pscan-chip-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pscan-chip-data" \ 
    about.summary="auxiliary data for PScan-ChIP" \ 
    about.home="http://www.beaconlab.it/pscan_chip_dev/" \ 
    software.version="1.1-2-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    extra.identifiers.biotools="pscan-chip" \ 
    about.copyright="2013 Federico Zambelli <f.zambelli@ibiom.cnr.it>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/pscan-chip-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pscan-chip-data || apt-get install -y pscan-chip-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
