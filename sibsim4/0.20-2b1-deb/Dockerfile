FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sibsim4" \ 
    container="sibsim4" \ 
    about.summary="align expressed RNA sequences on a DNA template" \ 
    about.home="http://sibsim4.sourceforge.net/" \ 
    software.version="0.20-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/sibsim4/copyright" \ 
    extra.binaries="/usr/bin/SIBsim4" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::TODO,:comparing,:searching, works-with-format::TODO,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sibsim4 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
