FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="artemis" \ 
    container="artemis" \ 
    about.summary="genome browser and annotation tool" \ 
    about.home="http://www.sanger.ac.uk/science/tools/artemis" \ 
    software.version="16.0.17dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="artemis" \ 
    about.copyright="1998-2013 Genome Research Limited" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/artemis/copyright" \ 
    extra.binaries="/usr/bin/act,/usr/bin/art,/usr/bin/bamview,/usr/bin/dnaplotter" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::java,:graphical, role::program, scope::utility, use::analysing,:comparing,:editing, works-with::biological-sequence,:application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y artemis && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
