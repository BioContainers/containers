FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="prank" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="prank" \ 
    about.summary="Probabilistic Alignment Kit for DNA, codon and amino-acid sequences" \ 
    about.home="http://wasabiapp.org/software/prank/" \ 
    software.version="0.0.170427dfsg-2-deb" \ 
    upstream.version="0.0.170427" \ 
    version="1" \ 
    extra.identifiers.biotools="prank" \ 
    about.copyright=" 2005-2015 Ari Loytynoja <ari.loytynoja@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/prank/copyright" \ 
    extra.binaries="/usr/bin/prank" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y prank || apt-get install -y prank) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
