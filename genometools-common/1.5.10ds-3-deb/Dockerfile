FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="genometools-common" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="genometools-common" \ 
    about.summary="shared data files for GenomeTools" \ 
    about.home="http://genometools.org" \ 
    software.version="1.5.10ds-3-deb" \ 
    upstream.version="1.5.10" \ 
    version="1" \ 
    extra.identifiers.biotools="genometools" \ 
    about.license="custom, see /usr/share/doc/genometools-common/copyright" \ 
    about.license_file="/usr/share/doc/genometools-common/copyright" \ 
    about.tags="role::app-data, uitoolkit::ncurses" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y genometools-common || apt-get install -y genometools-common) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
