FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gwama" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gwama" \ 
    about.summary="Genome-Wide Association Meta Analysis" \ 
    about.home="https://www.geenivaramu.ee/en/tools/gwama" \ 
    software.version="2.2.2dfsg-2-deb" \ 
    upstream.version="2.2.2" \ 
    version="1" \ 
    extra.identifiers.biotools="gwama" \ 
    about.copyright="2009-2010 Reedik Mgi, Andrew P Morris <amorris at well.ox.ac.uk>." \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/gwama/copyright" \ 
    extra.binaries="/usr/bin/GWAMA" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gwama || apt-get install -y gwama) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
