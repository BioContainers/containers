FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="harvest-tools" \ 
    container="harvest-tools" \ 
    about.summary="archiving and postprocessing for reference-compressed genomic multi-alignments" \ 
    about.home="http://harvest.readthedocs.org/en/latest/content/harvest-tools.html" \ 
    software.version="1.3-1-deb" \ 
    version="1" \ 
    about.copyright="2014 Brian Ondov, Todd Treangen, and Adam Phillippy" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/harvest-tools/copyright" \ 
    extra.binaries="/usr/bin/harvesttools" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y harvest-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
