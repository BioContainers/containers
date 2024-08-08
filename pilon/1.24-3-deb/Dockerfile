FROM debian:trixie-slim

MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="pilon" \ 
    base_image="debian:trixie-slim" \ 
    container="pilon" \ 
    about.summary="automated genome assembly improvement and variant detection tool" \ 
    about.home="https://github.com/broadinstitute/pilon/wiki" \ 
    software.version="1.24-3-deb" \ 
    upstream.version="1.24" \ 
    version="1" \ 
    extra.identifiers.biotools="pilon" \ 
    about.copyright="Copyright 2012-2017 Broad Institute, Inc." \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/pilon/copyright" \ 
    extra.binaries="/usr/bin/pilon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pilon=1.24-3 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
