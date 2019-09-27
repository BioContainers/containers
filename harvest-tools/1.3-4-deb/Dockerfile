FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="harvest-tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="harvest-tools" \ 
    about.summary="archiving and postprocessing for reference-compressed genomic multi-alignments" \ 
    about.home="http://harvest.readthedocs.org/en/latest/content/harvest-tools.html" \ 
    software.version="1.3-4-deb" \ 
    upstream.version="1.3" \ 
    version="1" \ 
    about.copyright="2014 Brian Ondov, Todd Treangen, and Adam Phillippy" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/harvest-tools/copyright" \ 
    extra.binaries="/usr/bin/harvesttools" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y harvest-tools || apt-get install -y harvest-tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
