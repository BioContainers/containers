FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sniffles" \ 
    container="sniffles" \ 
    about.summary="structural variation caller using third-generation sequencing" \ 
    about.home="http://fritzsedlazeck.github.io/Sniffles" \ 
    software.version="1.0.2ds-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="sniffles" \ 
    about.copyright="2015-2016 Fritz Sedlazeck <fritz.sedlazeck@gmail.com>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/sniffles/copyright" \ 
    extra.binaries="/usr/bin/sniffles" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sniffles && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
