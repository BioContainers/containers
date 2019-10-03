FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ismrmrd-schema" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ismrmrd-schema" \ 
    about.summary="schema for ISMRMRD" \ 
    about.home="http://ismrmrd.github.io/" \ 
    software.version="1.4.0-1-deb" \ 
    upstream.version="1.4.0" \ 
    version="1" \ 
    about.copyright="2013-2014 Michael S. Hansen <michael.hansen@nih.gov>" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/ismrmrd-schema/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ismrmrd-schema || apt-get install -y ismrmrd-schema) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
