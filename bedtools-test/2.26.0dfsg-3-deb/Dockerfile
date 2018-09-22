FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bedtools-test" \ 
    container="bedtools-test" \ 
    about.summary="test data for the bedtools package" \ 
    about.home="https://github.com/arq5x/bedtools2" \ 
    software.version="2.26.0dfsg-3-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="bedtools" \ 
    about.copyright=" 2009,2010,2011 Aaron Quinlan" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/bedtools-test/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y bedtools-test && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
