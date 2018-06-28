FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="augustus-data" \ 
    container="augustus-data" \ 
    about.summary="data files for AUGUSTUS" \ 
    about.home="http://bioinf.uni-greifswald.de/augustus/" \ 
    software.version="3.2.3dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="augustus" \ 
    about.copyright=" 2004-2016 Lizzy Gerischer, Oliver Keller, Stefanie Knig," \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/augustus-data/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, role::app-data,:analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y augustus-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
