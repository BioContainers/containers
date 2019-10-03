FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="indelible" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="indelible" \ 
    about.summary="powerful and flexible simulator of biological evolution" \ 
    about.home="http://abacus.gene.ucl.ac.uk/software/indelible/" \ 
    software.version="1.03-4-deb" \ 
    upstream.version="1.03" \ 
    version="1" \ 
    about.copyright=" 2010 William Fletcher" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/indelible/copyright" \ 
    extra.binaries="/usr/bin/indelible" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y indelible || apt-get install -y indelible) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
