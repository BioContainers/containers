FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="autogrid" \ 
    container="autogrid" \ 
    about.summary="pre-calculate binding of ligands to their receptor" \ 
    about.home="http://autodock.scripps.edu/" \ 
    software.version="4.2.6-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/autogrid/copyright" \ 
    extra.binaries="/usr/bin/autogrid4" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::c++,:commandline, role::program, scope::utility, use::analysing,:TODO, works-with::3dmodel" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y autogrid && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
