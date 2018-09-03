FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="snpomatic" \ 
    container="snpomatic" \ 
    about.summary="fast, stringent short-read mapping software" \ 
    about.home="https://github.com/magnusmanske/snpomatic" \ 
    software.version="1.0-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/snpomatic/copyright" \ 
    extra.binaries="/usr/bin/findknownsnps" \ 
    extra.identifiers.conda="snpomatic" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::comparing,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y snpomatic && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
