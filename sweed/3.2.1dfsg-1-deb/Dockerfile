FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sweed" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sweed" \ 
    about.summary="assessment of SNPs for their evolutionary advantage" \ 
    about.home="https://sco.h-its.org/exelixis/web/software/sweed/" \ 
    software.version="3.2.1dfsg-1-deb" \ 
    upstream.version="3.2.1" \ 
    version="1" \ 
    extra.identifiers.biotools="sweed" \ 
    about.copyright="2011-12 Nikolaos Alachiotis and Pavlos Pavlidis" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/sweed/copyright" \ 
    extra.binaries="/usr/bin/SweeD" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sweed || apt-get install -y sweed) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
