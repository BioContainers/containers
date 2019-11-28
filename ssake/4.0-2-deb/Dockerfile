FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ssake" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ssake" \ 
    about.summary="genomics application for assembling millions of very short DNA sequences" \ 
    about.home="http://www.bcgsc.ca/platform/bioinfo/software/ssake" \ 
    software.version="4.0-2-deb" \ 
    upstream.version="4.0" \ 
    version="1" \ 
    extra.identifiers.biotools="ssake" \ 
    about.copyright=" 2006-2018  Canada s Michael Smith Genome Science Centre" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/ssake/copyright" \ 
    extra.binaries="/usr/bin/ssake,/usr/bin/tqs" \ 
    about.tags="field::biology, implemented-in::perl, implemented-in::python,:commandline,:shell, role::program,:utility, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ssake || apt-get install -y ssake) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
