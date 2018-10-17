FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="abyss" \ 
    container="abyss" \ 
    about.summary="de novo, parallel, sequence assembler for short reads" \ 
    about.home="http://www.bcgsc.ca/platform/bioinfo/software/abyss" \ 
    software.version="2.0.2-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="abyss" \ 
    about.copyright="Copyright 2014 Canada s Michael Smith Genome Sciences Centre" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/abyss/copyright" \ 
    extra.binaries="/usr/bin/DistanceEst,/usr/bin/abyss-fixmate,/usr/bin/abyss-pe" \ 
    about.tags="field::biology, implemented-in::c, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y abyss && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
