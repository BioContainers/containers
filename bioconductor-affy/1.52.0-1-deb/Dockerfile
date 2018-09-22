FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-affy" \ 
    container="bioconductor-affy" \ 
    about.summary="BioConductor methods for Affymetrix Oligonucleotide Arrays" \ 
    about.home="https://bioconductor.org/packages/affy/" \ 
    software.version="1.52.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Rafael A. Irizarry <rafa@jhu.edu>," \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-affy/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-affy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
