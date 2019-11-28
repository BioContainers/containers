FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="barrnap" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="barrnap" \ 
    about.summary="rapid ribosomal RNA prediction" \ 
    about.home="http://www.vicbioinformatics.com/software.barrnap.shtml" \ 
    software.version="0.9dfsg-1-deb" \ 
    upstream.version="0.9" \ 
    version="1" \ 
    extra.identifiers.biotools="barrnap" \ 
    about.copyright="" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/barrnap/copyright" \ 
    extra.binaries="/usr/bin/barrnap" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:commandline, role::program, use::searching,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y barrnap || apt-get install -y barrnap) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
