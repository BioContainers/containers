FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="barrnap" \ 
    container="barrnap" \ 
    about.summary="rapid ribosomal RNA prediction" \ 
    about.home="http://www.vicbioinformatics.com/software.barrnap.shtml" \ 
    software.version="0.7dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="barrnap" \ 
    about.copyright="" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/barrnap/copyright" \ 
    extra.binaries="/usr/bin/barrnap" \ 
    extra.identifiers.conda="barrnap" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::perl,:commandline, role::program, use::searching,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y barrnap && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
