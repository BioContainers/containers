FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hhsuite-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="hhsuite-data" \ 
    about.summary="sensitive protein sequence searching based on HMM-HMM alignment (data)" \ 
    about.home="https://toolkit.tuebingen.mpg.de/" \ 
    software.version="3.0beta3dfsg-3-deb" \ 
    version="1" \ 
    about.copyright="2006, 2012 Johannes Soeding" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/hhsuite-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y hhsuite-data || apt-get install -y hhsuite-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
