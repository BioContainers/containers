FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-variantannotation" \ 
    container="bioconductor-variantannotation" \ 
    about.summary="BioConductor annotation of genetic variants" \ 
    about.home="https://bioconductor.org/packages/VariantAnnotation/" \ 
    software.version="1.20.2-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bioconductor-variantannotation/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-variantannotation && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
