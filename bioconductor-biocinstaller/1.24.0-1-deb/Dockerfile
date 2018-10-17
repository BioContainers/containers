FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-biocinstaller" \ 
    container="bioconductor-biocinstaller" \ 
    about.summary="Install/Update Bioconductor and CRAN Packages" \ 
    about.home="https://bioconductor.org/packages/BiocInstaller/" \ 
    software.version="1.24.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Dan Tenenbaum and Biocore Team" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-biocinstaller/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-biocinstaller && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
