FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="circos-tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="circos-tools" \ 
    about.summary="plotter for visualizing data - helper utilities" \ 
    about.home="http://circos.ca/" \ 
    software.version="0.23-1-deb" \ 
    upstream.version="0.23" \ 
    version="1" \ 
    about.copyright="Copyright 2004-2014 Martin Krzywinski" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/circos-tools/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y circos-tools || apt-get install -y circos-tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
