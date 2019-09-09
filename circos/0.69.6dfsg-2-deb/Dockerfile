FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="circos" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="circos" \ 
    about.summary="plotter for visualizing data" \ 
    about.home="http://circos.ca/" \ 
    software.version="0.69.6dfsg-2-deb" \ 
    upstream.version="0.69.6" \ 
    version="1" \ 
    extra.identifiers.biotools="circos" \ 
    about.copyright="Copyright 2004-2016 Martin Krzywinski" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/circos/copyright" \ 
    extra.binaries="/usr/bin/circos" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:program, use::viewing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y circos || apt-get install -y circos) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
