FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plink" \ 
    container="plink" \ 
    about.summary="whole-genome association analysis toolset" \ 
    about.home="http://pngu.mgh.harvard.edu/~purcell/plink/" \ 
    software.version="1.07-7-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="plink" \ 
    about.copyright="2005-2009 Shaun Purcell <plink@chgr.mgh.harvard.edu>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/plink/copyright" \ 
    extra.binaries="/usr/bin/p-link,/usr/bin/plink1" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y plink && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
