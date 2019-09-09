FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="circlator" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="circlator" \ 
    about.summary="circularize genome assemblies" \ 
    about.home="http://sanger-pathogens.github.io/circlator/" \ 
    software.version="1.5.5-3-deb" \ 
    upstream.version="1.5.5" \ 
    version="1" \ 
    about.copyright="2015-2016 Martin Hunt <mh12@sanger.ac.uk>" \ 
    about.license="GPL-3.0" \ 
    about.license_file="/usr/share/doc/circlator/copyright" \ 
    extra.binaries="/usr/bin/circlator" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:python, role::program, science::calculation,:biological-sequence,:file" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y circlator || apt-get install -y circlator) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
