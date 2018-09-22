FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clustalw" \ 
    container="clustalw" \ 
    about.summary="global multiple nucleotide or peptide sequence alignment" \ 
    about.home="http://www.clustal.org/clustal2/" \ 
    software.version="2.1lgpl-5-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="clustalw" \ 
    about.copyright=" Des Higgins, Julie Thompson and Toby Gibson" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/clustalw/copyright" \ 
    extra.binaries="/usr/bin/clustalw" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c++,:commandline,:text-mode, role::program,:utility, use::comparing, works-with-format::plaintext,:TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y clustalw && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
