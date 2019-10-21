FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="toppred" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="toppred" \ 
    about.summary="transmembrane topology prediction" \ 
    about.home="https://github.com/bioinfo-center-pasteur-fr/toppred" \ 
    software.version="1.10-7-deb" \ 
    upstream.version="1.10" \ 
    version="1" \ 
    about.copyright=" 1999-2001 Eric Deveaud <edeveaud@pasteur.fr>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/toppred/copyright" \ 
    extra.binaries="/usr/bin/toppred" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y toppred || apt-get install -y toppred) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
