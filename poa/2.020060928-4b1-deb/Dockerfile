FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="poa" \ 
    container="poa" \ 
    about.summary="Partial Order Alignment for multiple sequence alignment" \ 
    about.home="http://poamsa.sourceforge.net/" \ 
    software.version="2.020060928-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/poa/copyright" \ 
    extra.binaries="/usr/bin/poa" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y poa && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
