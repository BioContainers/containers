FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="circlator" \ 
    container="circlator" \ 
    about.summary="circularize genome assemblies" \ 
    about.home="http://sanger-pathogens.github.io/circlator/" \ 
    software.version="1.4.1-1-deb" \ 
    version="1" \ 
    about.copyright="2015-2016 Martin Hunt <mh12@sanger.ac.uk>" \ 
    about.license="GPL-3.0" \ 
    about.license_file="/usr/share/doc/circlator/copyright" \ 
    extra.binaries="/usr/bin/circlator" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:python, role::program, science::calculation,:biological-sequence,:file" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y circlator && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
