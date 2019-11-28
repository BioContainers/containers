FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="augustus-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="augustus-data" \ 
    about.summary="data files for AUGUSTUS" \ 
    about.home="http://bioinf.uni-greifswald.de/augustus/" \ 
    software.version="3.3.2dfsg-2-deb" \ 
    upstream.version="3.3.2" \ 
    version="1" \ 
    extra.identifiers.biotools="augustus" \ 
    about.copyright=" 2004-2016 Lizzy Gerischer, Oliver Keller, Stefanie Knig," \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/augustus-data/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, role::app-data,:program, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y augustus-data || apt-get install -y augustus-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
