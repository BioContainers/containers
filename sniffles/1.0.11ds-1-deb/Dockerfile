FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sniffles" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sniffles" \ 
    about.summary="structural variation caller using third-generation sequencing" \ 
    about.home="http://fritzsedlazeck.github.io/Sniffles" \ 
    software.version="1.0.11ds-1-deb" \ 
    upstream.version="1.0.11" \ 
    version="1" \ 
    extra.identifiers.biotools="sniffles" \ 
    about.copyright="2015-2016 Fritz Sedlazeck <fritz.sedlazeck@gmail.com>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/sniffles/copyright" \ 
    extra.binaries="/usr/bin/sniffles" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sniffles || apt-get install -y sniffles) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
