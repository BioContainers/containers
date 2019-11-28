FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="metaphlan2-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="metaphlan2-data" \ 
    about.summary="data package for Metagenomic Phylogenetic Analysis" \ 
    about.home="https://bitbucket.org/biobakery/metaphlan2" \ 
    software.version="2.6.0ds-4-deb" \ 
    upstream.version="2.6.0" \ 
    version="1" \ 
    about.copyright="2012-2016 Duy Tin Truong, Nicola Segata and Curtis Huttenhower" \ 
    about.license="expat" \ 
    about.license_file="/usr/share/doc/metaphlan2-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y metaphlan2-data || apt-get install -y metaphlan2-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
