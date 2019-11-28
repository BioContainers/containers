FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plink1.9" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="plink1.9" \ 
    about.summary="whole-genome association analysis toolset" \ 
    about.home="https://www.cog-genomics.org/plink/1.9/" \ 
    software.version="1.90b6.6-181012-1-deb" \ 
    version="1" \ 
    about.copyright="2005-2018 Shaun Purcell <plink@chgr.mgh.harvard.edu>, Christopher Chang" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/plink1.9/copyright" \ 
    extra.binaries="/usr/bin/plink1.9" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y plink1.9 || apt-get install -y plink1.9) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
