FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="poa" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="poa" \ 
    about.summary="Partial Order Alignment for multiple sequence alignment" \ 
    about.home="http://poamsa.sourceforge.net/" \ 
    software.version="2.020060928-7-deb" \ 
    upstream.version="2.0" \ 
    version="1" \ 
    about.copyright="2004-2006 Christopher Lee <leec@mbi.ucla.edu>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/poa/copyright" \ 
    extra.binaries="/usr/bin/poa" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y poa || apt-get install -y poa) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
