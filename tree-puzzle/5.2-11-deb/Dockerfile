FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tree-puzzle" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="tree-puzzle" \ 
    about.summary="Reconstruction of phylogenetic trees by maximum likelihood" \ 
    about.home="http://www.tree-puzzle.de" \ 
    software.version="5.2-11-deb" \ 
    upstream.version="5.2" \ 
    version="1" \ 
    extra.identifiers.biotools="tree-puzzle" \ 
    about.copyright="1995-1999 Korbinian Strimmer <korbinian.strimmer@zoo.ox.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/tree-puzzle/copyright" \ 
    extra.binaries="/usr/bin/tree-puzzle" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y tree-puzzle || apt-get install -y tree-puzzle) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
