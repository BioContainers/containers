FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ssake" \ 
    container="ssake" \ 
    about.summary="genomics application for assembling millions of very short DNA sequences" \ 
    about.home="http://www.bcgsc.ca/platform/bioinfo/software/ssake" \ 
    software.version="3.8.4-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="ssake" \ 
    about.copyright=" 2006-2011  Canada s Michael Smith Genome Science Centre" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/ssake/copyright" \ 
    extra.binaries="/usr/bin/ssake,/usr/bin/tqs" \ 
    about.tags="field::biology, implemented-in::perl, implemented-in::python,:shell, role::program, scope::utility, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ssake && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
