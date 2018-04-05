FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="profisis" \ 
    container="profisis" \ 
    about.summary="prediction of protein-protein interaction sites from sequence" \ 
    about.home="https://rostlab.org/owiki/index.php/PROFisis" \ 
    software.version="1.0.11-3-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="profisis" \ 
    about.copyright="2006 Yanay Ofran" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/profisis/copyright" \ 
    extra.binaries="/usr/bin/profisis" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y profisis && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
