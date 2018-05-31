FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-biostrings" \ 
    container="bioconductor-biostrings" \ 
    about.summary="GNU R string objects representing biological sequences" \ 
    about.home="https://bioconductor.org/packages/Biostrings/" \ 
    software.version="2.42.1-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 H. Pages, R. Gentleman, P. Aboyoun and S. DebRoy" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-biostrings/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-biostrings && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
