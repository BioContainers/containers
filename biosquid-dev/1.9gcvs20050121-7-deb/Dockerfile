FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biosquid-dev" \ 
    container="biosquid-dev" \ 
    about.summary="headers and static library for biological sequence analysis" \ 
    about.home="http://eddylab.org/software.html" \ 
    software.version="1.9gcvs20050121-7-deb" \ 
    version="1" \ 
    about.copyright="1992-2006 Sean Eddy <eddy@genetics.wustl.edu>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/biosquid-dev/copyright" \ 
    about.tags="devel::lang:c, devel::library, field::biology,:biology:bioinformatics, implemented-in::c, role::devel-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y biosquid-dev && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
