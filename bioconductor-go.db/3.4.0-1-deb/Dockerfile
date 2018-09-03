FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-go.db" \ 
    container="bioconductor-go.db" \ 
    about.summary="annotation maps describing the entire Gene Ontology" \ 
    about.home="https://bioconductor.org/packages/GO.db/" \ 
    software.version="3.4.0-1-deb" \ 
    version="1" \ 
    about.copyright="2006-2016 Marc Carlson" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-go.db/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-go.db && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
