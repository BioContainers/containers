FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tnseq-transit" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="tnseq-transit" \ 
    about.summary="statistical calculations of essentiality of genes or genomic regions" \ 
    about.home="http://saclab.tamu.edu/essentiality/transit/" \ 
    software.version="2.3.4-1-deb" \ 
    upstream.version="2.3.4" \ 
    version="1" \ 
    about.copyright="2015-2017 Michael A. DeJesus, Chaitra Ambadipudi, and  Thomas R. Ioerger" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/tnseq-transit/copyright" \ 
    extra.binaries="/usr/bin/transit,/usr/bin/transit-tpp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y tnseq-transit || apt-get install -y tnseq-transit) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
