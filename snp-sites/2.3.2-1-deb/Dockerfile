FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="snp-sites" \ 
    container="snp-sites" \ 
    about.summary="Binary code for the package snp-sites" \ 
    about.home="https://github.com/sanger-pathogens/snp-sites" \ 
    software.version="2.3.2-1-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/snp-sites/copyright" \ 
    extra.binaries="/usr/bin/snp-sites" \ 
    extra.identifiers.conda="snp-sites" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y snp-sites && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
