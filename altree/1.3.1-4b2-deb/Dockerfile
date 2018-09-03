FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="altree" \ 
    container="altree" \ 
    about.summary="program to perform phylogeny-based association and localization analysis" \ 
    about.home="http://claire.bardel.free.fr/software.html" \ 
    software.version="1.3.1-4b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/altree/copyright" \ 
    extra.binaries="/usr/bin/altree,/usr/bin/altree-add-S,/usr/bin/altree-convert" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:perl, interface::commandline, role::program,:shared-lib, scope::utility, use::analysing, use::comparing,:TODO,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y altree && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
