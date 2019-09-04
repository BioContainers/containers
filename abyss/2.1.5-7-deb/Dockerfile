FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="abyss" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="abyss" \ 
    about.summary="de novo, parallel, sequence assembler for short reads" \ 
    about.home="http://www.bcgsc.ca/platform/bioinfo/software/abyss" \ 
    software.version="2.1.5-7-deb" \ 
    upstream.version="2.1.5" \ 
    version="1" \ 
    extra.identifiers.biotools="abyss" \ 
    about.copyright="Copyright 2014 Canada s Michael Smith Genome Sciences Centre" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/abyss/copyright" \ 
    extra.binaries="/usr/bin/DistanceEst,/usr/bin/abyss-fixmate,/usr/bin/abyss-pe" \ 
    about.tags="field::biology, implemented-in::c, interface::commandline, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y abyss || apt-get install -y abyss) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
