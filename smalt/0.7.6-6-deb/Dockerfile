FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="smalt" \ 
    container="smalt" \ 
    about.summary="Sequence Mapping and Alignment Tool" \ 
    about.home="http://www.sanger.ac.uk/science/tools/smalt-0" \ 
    software.version="0.7.6-6-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="smalt" \ 
    about.copyright="2010-2014 Hannes Ponstingl at the Wellcome Trust Sanger Institute, Cambridge, UK" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/smalt/copyright" \ 
    extra.binaries="/usr/bin/smalt" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y smalt && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
