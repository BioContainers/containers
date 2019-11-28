FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="artfastqgenerator" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="artfastqgenerator" \ 
    about.summary="outputs artificial FASTQ files derived from a reference genome" \ 
    about.home="https://sourceforge.net/projects/artfastqgen/" \ 
    software.version="0.0.20150519-3-deb" \ 
    upstream.version="0.0.20150519" \ 
    version="1" \ 
    about.copyright="2010-2012 Matthew Frampton <Matthew.Frampton@icr.ac.uk>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/artfastqgenerator/copyright" \ 
    extra.binaries="/usr/bin/artfastqgenerator" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y artfastqgenerator || apt-get install -y artfastqgenerator) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
