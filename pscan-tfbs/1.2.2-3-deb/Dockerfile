FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pscan-tfbs" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pscan-tfbs" \ 
    about.summary="search for transcription factor binding sites" \ 
    about.home="http://www.beaconlab.it/pscan" \ 
    software.version="1.2.2-3-deb" \ 
    upstream.version="1.2.2" \ 
    version="1" \ 
    about.copyright="2012 G.Pesole" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/pscan-tfbs/copyright" \ 
    extra.binaries="/usr/bin/pscan-tfbs" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pscan-tfbs || apt-get install -y pscan-tfbs) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
