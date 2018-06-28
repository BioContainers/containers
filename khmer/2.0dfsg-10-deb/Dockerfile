FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="khmer" \ 
    container="khmer" \ 
    about.summary="in-memory DNA sequence kmer counting, filtering & graph traversal" \ 
    about.home="http://khmer.readthedocs.org" \ 
    software.version="2.0dfsg-10-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="khmer" \ 
    about.copyright="2010-2015, Michigan State University" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/khmer/copyright" \ 
    extra.binaries="/usr/bin/khmer" \ 
    about.tags="biology::format:fasta, biology::nucleic-acids, field::biology,:biology:bioinformatics, implemented-in::c++,:python, interface::commandline, role::program,:analysing,:comparing,:filtering" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y khmer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
