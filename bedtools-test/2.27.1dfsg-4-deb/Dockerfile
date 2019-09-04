FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bedtools-test" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bedtools-test" \ 
    about.summary="test data for the bedtools package" \ 
    about.home="https://github.com/arq5x/bedtools2" \ 
    software.version="2.27.1dfsg-4-deb" \ 
    upstream.version="2.27.1" \ 
    version="1" \ 
    extra.identifiers.biotools="bedtools" \ 
    about.copyright=" 2009,2010,2011 Aaron Quinlan" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/bedtools-test/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bedtools-test || apt-get install -y bedtools-test) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
