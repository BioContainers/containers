FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbalign" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbalign" \ 
    about.summary="map Pacific Biosciences reads to reference DNA sequences (Python2)" \ 
    about.home="https://github.com/PacificBiosciences/pbalign" \ 
    software.version="0.3.2-1-deb-py2" \ 
    upstream.version="0.3.2" \ 
    version="1" \ 
    about.copyright="2011-2014 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbalign/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pbalign || apt-get install -y python-pbalign) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
