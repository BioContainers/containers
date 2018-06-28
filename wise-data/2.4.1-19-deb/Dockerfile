FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="wise-data" \ 
    container="wise-data" \ 
    about.summary="data files for the wise package" \ 
    about.home="http://www.ebi.ac.uk/~birney/wise2/" \ 
    software.version="2.4.1-19-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="wise" \ 
    about.copyright=" 1996-2001 Genome Research Limited (GRL) and" \ 
    about.license="GRL" \ 
    about.license_file="/usr/share/doc/wise-data/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wise-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
