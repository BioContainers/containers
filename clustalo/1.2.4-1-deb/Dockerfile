FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clustalo" \ 
    container="clustalo" \ 
    about.summary="General purpose multiple sequence alignment program for proteins" \ 
    about.home="http://www.clustal.org/omega/" \ 
    software.version="1.2.4-1-deb" \ 
    version="1" \ 
    about.copyright="2010 UCD Dublin <clustalw@ucd.ie>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/clustalo/copyright" \ 
    extra.binaries="/usr/bin/clustalo" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y clustalo && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
