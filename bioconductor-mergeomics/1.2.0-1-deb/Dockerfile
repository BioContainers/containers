FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-mergeomics" \ 
    container="bioconductor-mergeomics" \ 
    about.summary="Integrative network analysis of omics data" \ 
    about.home="https://bioconductor.org/packages/Mergeomics/" \ 
    software.version="1.2.0-1-deb" \ 
    version="1" \ 
    about.copyright="2013-2016 Ville-Petteri Makinen, Le Shu, Yuqi Zhao, Zeyneb Kurt, Bin Zhang, Xia Yang" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/bioconductor-mergeomics/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-mergeomics && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
