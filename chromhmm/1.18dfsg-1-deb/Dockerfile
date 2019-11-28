FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="chromhmm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="chromhmm" \ 
    about.summary="Chromatin state discovery and characterization" \ 
    about.home="http://compbio.mit.edu/ChromHMM/" \ 
    software.version="1.18dfsg-1-deb" \ 
    upstream.version="1.18" \ 
    version="1" \ 
    extra.identifiers.biotools="chromhmm" \ 
    about.copyright="2008-2016 Massachusetts Institute of Technology" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/chromhmm/copyright" \ 
    extra.binaries="/usr/bin/ChromHMM" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y chromhmm || apt-get install -y chromhmm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
