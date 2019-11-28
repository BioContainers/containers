FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="artemis" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="artemis" \ 
    about.summary="genome browser and annotation tool" \ 
    about.home="http://www.sanger.ac.uk/science/tools/artemis" \ 
    software.version="17.0.1dfsg-2-deb" \ 
    upstream.version="17.0.1" \ 
    version="1" \ 
    extra.identifiers.biotools="artemis" \ 
    about.copyright="1998-2013 Genome Research Limited" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/artemis/copyright" \ 
    extra.binaries="/usr/bin/act,/usr/bin/art,/usr/bin/bamview,/usr/bin/dnaplotter" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::java,:commandline,:graphical,:x11,:program, scope::utility, use::analysing, use::comparing,:editing, works-with::biological-sequence, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y artemis || apt-get install -y artemis) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
