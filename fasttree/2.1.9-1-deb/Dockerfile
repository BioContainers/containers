FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fasttree" \ 
    container="fasttree" \ 
    about.summary="phylogenetic trees from alignments of nucleotide or protein sequences" \ 
    about.home="http://www.microbesonline.org/fasttree/" \ 
    software.version="2.1.9-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="fasttree" \ 
    about.copyright="(C) 2008-2009 The Regents of the University of California" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/fasttree/copyright" \ 
    extra.binaries="/usr/bin/fasttree,/usr/bin/fasttreeMP" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fasttree && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
