FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-metagenomeseq" \ 
    container="bioconductor-metagenomeseq" \ 
    about.summary="GNU R statistical analysis for sparse high-throughput sequencing" \ 
    about.home="https://bioconductor.org/packages/metagenomeSeq/" \ 
    software.version="1.16.0-2-deb" \ 
    version="1" \ 
    about.copyright=" 2010-2016 Joseph N. Paulson <jpaulson@jimmy.harvard.edu>" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-metagenomeseq/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-metagenomeseq && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
