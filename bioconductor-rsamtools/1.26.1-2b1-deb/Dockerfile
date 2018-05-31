FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-rsamtools" \ 
    container="bioconductor-rsamtools" \ 
    about.summary="GNU R binary alignment (BAM), variant call (BCF), or tabix file import" \ 
    about.home="https://bioconductor.org/packages/Rsamtools/" \ 
    software.version="1.26.1-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bioconductor-rsamtools/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-rsamtools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
