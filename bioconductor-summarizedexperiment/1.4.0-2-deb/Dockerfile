FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-summarizedexperiment" \ 
    container="bioconductor-summarizedexperiment" \ 
    about.summary="BioConductor assay container" \ 
    about.home="https://bioconductor.org/packages/SummarizedExperiment/" \ 
    software.version="1.4.0-2-deb" \ 
    version="1" \ 
    about.copyright=" 2014-2016 Martin Morgan, Valerie Obenchain, Jim Hester, Herv Pags" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-summarizedexperiment/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-summarizedexperiment && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
