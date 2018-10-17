FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="prank" \ 
    container="prank" \ 
    about.summary="Probabilistic Alignment Kit for DNA, codon and amino-acid sequences" \ 
    about.home="http://wasabiapp.org/software/prank/" \ 
    software.version="0.0.150803-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="prank" \ 
    about.copyright=" 2005-2015 Ari Loytynoja <ari.loytynoja@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/prank/copyright" \ 
    extra.binaries="/usr/bin/prank" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y prank && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
