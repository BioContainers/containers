FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pilon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pilon" \ 
    about.summary="automated genome assembly improvement and variant detection tool" \ 
    about.home="https://github.com/broadinstitute/pilon/wiki" \ 
    software.version="1.23dfsg-1-deb" \ 
    upstream.version="1.23" \ 
    version="1" \ 
    extra.identifiers.biotools="pilon" \ 
    about.copyright="Copyright 2012-2017 Broad Institute, Inc." \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/pilon/copyright" \ 
    extra.binaries="/usr/bin/pilon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pilon || apt-get install -y pilon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
