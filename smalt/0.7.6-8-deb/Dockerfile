FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="smalt" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="smalt" \ 
    about.summary="Sequence Mapping and Alignment Tool" \ 
    about.home="http://www.sanger.ac.uk/science/tools/smalt-0" \ 
    software.version="0.7.6-8-deb" \ 
    upstream.version="0.7.6" \ 
    version="1" \ 
    extra.identifiers.biotools="smalt" \ 
    about.copyright="2010-2014 Hannes Ponstingl at the Wellcome Trust Sanger Institute, Cambridge, UK" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/smalt/copyright" \ 
    extra.binaries="/usr/bin/smalt" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y smalt || apt-get install -y smalt) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
