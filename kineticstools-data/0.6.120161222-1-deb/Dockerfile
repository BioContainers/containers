FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kineticstools-data" \ 
    container="kineticstools-data" \ 
    about.summary="detection of DNA modifications -- data files" \ 
    about.home="https://github.com/PacificBiosciences/kineticsTools" \ 
    software.version="0.6.120161222-1-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/kineticstools-data/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y kineticstools-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
