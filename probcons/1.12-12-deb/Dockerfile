FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="probcons" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="probcons" \ 
    about.summary="PROBabilistic CONSistency-based multiple sequence alignment" \ 
    about.home="http://probcons.stanford.edu/" \ 
    software.version="1.12-12-deb" \ 
    upstream.version="1.12" \ 
    version="1" \ 
    extra.identifiers.biotools="probcons" \ 
    about.copyright="2005-2009 Arun S Konagurthu <arun@bx.psu.edu>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/probcons/copyright" \ 
    extra.binaries="/usr/bin/probcons,/usr/bin/probcons-RNA" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility, use::comparing,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y probcons || apt-get install -y probcons) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
