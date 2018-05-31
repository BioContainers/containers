FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-xvector" \ 
    container="bioconductor-xvector" \ 
    about.summary="BioConductor representation and manpulation of external sequences" \ 
    about.home="https://bioconductor.org/packages/XVector/" \ 
    software.version="0.14.0-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bioconductor-xvector/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-xvector && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
