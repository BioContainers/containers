FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="khmer" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="khmer" \ 
    about.summary="in-memory DNA sequence kmer counting, filtering & graph traversal" \ 
    about.home="http://khmer.readthedocs.org" \ 
    software.version="2.1.2dfsg-6-deb" \ 
    upstream.version="2.1.2" \ 
    version="1" \ 
    extra.identifiers.biotools="khmer" \ 
    about.copyright="2010-2015, Michigan State University" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/khmer/copyright" \ 
    extra.binaries="/usr/bin/khmer" \ 
    about.tags="biology::format:fasta, biology::nucleic-acids, field::biology,:biology:bioinformatics, implemented-in::c++,:python, interface::commandline, role::program,:analysing,:comparing,:filtering" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y khmer || apt-get install -y khmer) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
