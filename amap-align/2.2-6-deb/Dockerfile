FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="amap-align" \ 
    container="amap-align" \ 
    about.summary="Protein multiple alignment by sequence annealing" \ 
    about.home="http://code.google.com/p/amap-align/" \ 
    software.version="2.2-6-deb" \ 
    version="1" \ 
    about.copyright="20052007 Ariel Schwartz <sariel@cs.berkeley.edu>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/amap-align/copyright" \ 
    extra.binaries="/usr/bin/amap" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y amap-align && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
