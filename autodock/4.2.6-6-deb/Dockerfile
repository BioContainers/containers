FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="autodock" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="autodock" \ 
    about.summary="analysis of ligand binding to protein structure" \ 
    about.home="http://autodock.scripps.edu/" \ 
    software.version="4.2.6-6-deb" \ 
    upstream.version="4.2.6" \ 
    version="1" \ 
    about.copyright="1989-2014, All Rights Reserved." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/autodock/copyright" \ 
    extra.binaries="/usr/bin/autodock4" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:TODO, works-with::3dmodel, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y autodock || apt-get install -y autodock) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
