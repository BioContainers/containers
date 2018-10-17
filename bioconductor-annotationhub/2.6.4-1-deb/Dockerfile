FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-annotationhub" \ 
    container="bioconductor-annotationhub" \ 
    about.summary="GNU R client to access AnnotationHub resources" \ 
    about.home="https://bioconductor.org/packages/AnnotationHub/" \ 
    software.version="2.6.4-1-deb" \ 
    version="1" \ 
    about.copyright="2006-2016 Martin Morgan, Marc Carlson, Dan Tenenbaum, Sonali Arora" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-annotationhub/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-annotationhub && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
