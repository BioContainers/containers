FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sumatra" \ 
    container="sumatra" \ 
    about.summary="fast and exact comparison and clustering of sequences" \ 
    about.home="http://metabarcoding.org/sumatra" \ 
    software.version="1.0.20-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/sumatra/copyright" \ 
    extra.binaries="/usr/bin/sumatra" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sumatra && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
