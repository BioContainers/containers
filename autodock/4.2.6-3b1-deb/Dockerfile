FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="autodock" \ 
    container="autodock" \ 
    about.summary="analysis of ligand binding to protein structure" \ 
    about.home="http://autodock.scripps.edu/" \ 
    software.version="4.2.6-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/autodock/copyright" \ 
    extra.binaries="/usr/bin/autodock4" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:TODO, works-with::3dmodel, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y autodock && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
