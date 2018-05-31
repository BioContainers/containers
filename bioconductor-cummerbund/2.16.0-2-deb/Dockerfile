FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-cummerbund" \ 
    container="bioconductor-cummerbund" \ 
    about.summary="tool for analysis of Cufflinks RNA-Seq output" \ 
    about.home="https://bioconductor.org/packages/cummeRbund/" \ 
    software.version="2.16.0-2-deb" \ 
    version="1" \ 
    about.copyright="2010-2016 Loyal A. Goff <lgoff@csail.mit.edu>" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-cummerbund/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-cummerbund && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
