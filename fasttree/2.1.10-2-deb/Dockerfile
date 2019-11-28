FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fasttree" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fasttree" \ 
    about.summary="phylogenetic trees from alignments of nucleotide or protein sequences" \ 
    about.home="http://www.microbesonline.org/fasttree/" \ 
    software.version="2.1.10-2-deb" \ 
    upstream.version="2.1.10" \ 
    version="1" \ 
    extra.identifiers.biotools="fasttree" \ 
    about.copyright="(C) 2008-2016 The Regents of the University of California" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/fasttree/copyright" \ 
    extra.binaries="/usr/bin/FastTree,/usr/bin/fasttree,/usr/bin/fasttreeMP" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fasttree || apt-get install -y fasttree) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
