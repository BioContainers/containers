FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-bsgenome" \ 
    container="bioconductor-bsgenome" \ 
    about.summary="BioConductor infrastructure for Biostrings-based genome data packages" \ 
    about.home="https://bioconductor.org/packages/BSgenome/" \ 
    software.version="1.42.0-2-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Herve Pages <hpages@fhcrc.org>" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-bsgenome/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-bsgenome && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
