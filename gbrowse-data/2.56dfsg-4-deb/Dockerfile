FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gbrowse-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gbrowse-data" \ 
    about.summary="Sample data to use GBrowse" \ 
    about.home="http://www.gbrowse.org/" \ 
    software.version="2.56dfsg-4-deb" \ 
    upstream.version="2.56" \ 
    version="1" \ 
    extra.identifiers.biotools="gbrowse" \ 
    about.copyright=" 2002 Cold Spring Harbor Laboratory and University of California, Berkeley" \ 
    about.license="GPL-1+ or Artistic-2.0" \ 
    about.license_file="/usr/share/doc/gbrowse-data/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, role::examples" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gbrowse-data || apt-get install -y gbrowse-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
