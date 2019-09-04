FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="amap-align" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="amap-align" \ 
    about.summary="Protein multiple alignment by sequence annealing" \ 
    about.home="https://github.com/mes5k/amap-align" \ 
    software.version="2.2git20080214.600fc29dfsg-1-deb" \ 
    upstream.version="2.2" \ 
    version="1" \ 
    about.copyright="20052007 Ariel Schwartz <sariel@cs.berkeley.edu>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/amap-align/copyright" \ 
    extra.binaries="/usr/bin/amap" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y amap-align || apt-get install -y amap-align) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
