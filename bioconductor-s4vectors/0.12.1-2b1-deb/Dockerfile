FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-s4vectors" \ 
    container="bioconductor-s4vectors" \ 
    about.summary="BioConductor S4 implementation of vectors and lists" \ 
    about.home="https://bioconductor.org/packages/S4Vectors/" \ 
    software.version="0.12.1-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bioconductor-s4vectors/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-s4vectors && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
