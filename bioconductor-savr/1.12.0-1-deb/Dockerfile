FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-savr" \ 
    container="bioconductor-savr" \ 
    about.summary="GNU R parse and analyze Illumina SAV files" \ 
    about.home="https://bioconductor.org/packages/savR/" \ 
    software.version="1.12.0-1-deb" \ 
    version="1" \ 
    about.copyright="2013-2016 R. Brent Calder <brent.calder@einstein.yu.edu>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/bioconductor-savr/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-savr && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
