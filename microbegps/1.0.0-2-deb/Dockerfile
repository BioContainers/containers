FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="microbegps" \ 
    container="microbegps" \ 
    about.summary="explorative taxonomic profiling tool for metagenomic data" \ 
    about.home="http://sourceforge.net/projects/microbegps/" \ 
    software.version="1.0.0-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="microbegps" \ 
    about.copyright="2014, Martin S. Lindner <LindnerM@rki.de>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/microbegps/copyright" \ 
    extra.binaries="/usr/bin/MicrobeGPS" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y microbegps && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
