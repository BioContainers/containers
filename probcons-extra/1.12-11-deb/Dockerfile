FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="probcons-extra" \ 
    container="probcons-extra" \ 
    about.summary="Extra programs from the probcons package" \ 
    about.home="http://probcons.stanford.edu/" \ 
    software.version="1.12-11-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="probcons" \ 
    about.copyright="2005-2009 Arun S Konagurthu <arun@bx.psu.edu>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/probcons-extra/copyright" \ 
    extra.binaries="/usr/bin/pc-compare,/usr/bin/pc-makegnuplot,/usr/bin/pc-project" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y probcons-extra && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
