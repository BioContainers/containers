FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clustalo" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="clustalo" \ 
    about.summary="General purpose multiple sequence alignment program for proteins" \ 
    about.home="http://www.clustal.org/omega/" \ 
    software.version="1.2.4-2-deb" \ 
    upstream.version="1.2.4" \ 
    version="1" \ 
    extra.identifiers.biotools="clustalo" \ 
    about.copyright="2010 UCD Dublin <clustalw@ucd.ie>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/clustalo/copyright" \ 
    extra.binaries="/usr/bin/clustalo" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y clustalo || apt-get install -y clustalo) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
