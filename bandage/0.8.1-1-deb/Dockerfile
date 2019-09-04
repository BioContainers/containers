FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bandage" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bandage" \ 
    about.summary="Bioinformatics Application for Navigating De novo Assembly Graphs Easily" \ 
    about.home="https://rrwick.github.io/Bandage" \ 
    software.version="0.8.1-1-deb" \ 
    upstream.version="0.8.1" \ 
    version="1" \ 
    extra.identifiers.biotools="bandage" \ 
    about.copyright="2015-2016, Ryan Wick" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/bandage/copyright" \ 
    extra.binaries="/usr/bin/Bandage" \ 
    about.tags="uitoolkit::qt" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bandage || apt-get install -y bandage) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
