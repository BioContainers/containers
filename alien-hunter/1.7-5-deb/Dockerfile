FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="alien-hunter" \ 
    container="alien-hunter" \ 
    about.summary="Interpolated Variable Order Motifs to identify horizontally acquired DNA" \ 
    about.home="http://www.sanger.ac.uk/science/tools/alien-hunter" \ 
    software.version="1.7-5-deb" \ 
    version="1" \ 
    about.copyright="2006-2008 George Vernikos" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/alien-hunter/copyright" \ 
    extra.binaries="/usr/bin/alien_hunter" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::java,:perl, role::program, scope::utility, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y alien-hunter && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
