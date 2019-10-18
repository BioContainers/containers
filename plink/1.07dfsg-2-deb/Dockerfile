FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plink" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="plink" \ 
    about.summary="whole-genome association analysis toolset" \ 
    about.home="http://zzz.bwh.harvard.edu/plink/" \ 
    software.version="1.07dfsg-2-deb" \ 
    upstream.version="1.07" \ 
    version="1" \ 
    extra.identifiers.biotools="plink" \ 
    about.copyright="2005-2009 Shaun Purcell <plink@chgr.mgh.harvard.edu>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/plink/copyright" \ 
    extra.binaries="/usr/bin/p-link,/usr/bin/plink1" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y plink || apt-get install -y plink) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
