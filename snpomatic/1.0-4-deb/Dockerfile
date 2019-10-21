FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="snpomatic" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="snpomatic" \ 
    about.summary="fast, stringent short-read mapping software" \ 
    about.home="https://github.com/magnusmanske/snpomatic" \ 
    software.version="1.0-4-deb" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    about.copyright=" 2009-2015 Magnus Manske <mm6@sanger.ac.uk>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/snpomatic/copyright" \ 
    extra.binaries="/usr/bin/findknownsnps" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::comparing,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y snpomatic || apt-get install -y snpomatic) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
