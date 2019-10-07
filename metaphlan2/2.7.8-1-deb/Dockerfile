FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="metaphlan2" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="metaphlan2" \ 
    about.summary="Metagenomic Phylogenetic Analysis" \ 
    about.home="https://bitbucket.org/biobakery/metaphlan2" \ 
    software.version="2.7.8-1-deb" \ 
    upstream.version="2.7.8" \ 
    version="1" \ 
    about.copyright="2012-2018 Duy Tin Truong, Nicola Segata and Curtis Huttenhower" \ 
    about.license="expat" \ 
    about.license_file="/usr/share/doc/metaphlan2/copyright" \ 
    extra.binaries="/usr/bin/metaphlan2,/usr/bin/strainphlan" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y metaphlan2 || apt-get install -y metaphlan2) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
