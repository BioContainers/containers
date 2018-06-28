FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-annotationdbi" \ 
    container="bioconductor-annotationdbi" \ 
    about.summary="GNU R Annotation Database Interface for BioConductor" \ 
    about.home="https://bioconductor.org/packages/AnnotationDbi/" \ 
    software.version="1.36.1-2-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Herve Pages, Marc Carlson, Seth Falcon, Nianhua Li" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-annotationdbi/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-annotationdbi && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
