FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-phyloseq" \ 
    container="bioconductor-phyloseq" \ 
    about.summary="GNU R handling and analysis of high-throughput microbiome census data" \ 
    about.home="https://bioconductor.org/packages/phyloseq/" \ 
    software.version="1.19.1-2-deb" \ 
    version="1" \ 
    about.copyright="2013-2016 Paul J. McMurdie <mcmurdie@stanford.edu>" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/bioconductor-phyloseq/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-phyloseq && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
