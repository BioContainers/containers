FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kineticstools-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="kineticstools-data" \ 
    about.summary="detection of DNA modifications -- data files" \ 
    about.home="https://github.com/PacificBiosciences/kineticsTools" \ 
    software.version="0.6.1git20180425.27a1878-2-deb" \ 
    upstream.version="0.6.1" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/kineticstools-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y kineticstools-data || apt-get install -y kineticstools-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
