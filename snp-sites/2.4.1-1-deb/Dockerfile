FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="snp-sites" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="snp-sites" \ 
    about.summary="Binary code for the package snp-sites" \ 
    about.home="https://github.com/sanger-pathogens/snp-sites" \ 
    software.version="2.4.1-1-deb" \ 
    upstream.version="2.4.1" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/snp-sites/copyright" \ 
    extra.binaries="/usr/bin/snp-sites" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y snp-sites || apt-get install -y snp-sites) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
