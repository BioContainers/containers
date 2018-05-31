FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-limma" \ 
    container="bioconductor-limma" \ 
    about.summary="linear models for microarray data" \ 
    about.home="https://bioconductor.org/packages/limma/" \ 
    software.version="3.30.8dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2005-2016 Gordon Smyth <smyth@wehi.edu.au>" \ 
    about.license="LGPL-2+" \ 
    about.license_file="/usr/share/doc/bioconductor-limma/copyright" \ 
    about.tags="biology::nucleic-acids, field::biology:bioinformatics,:r, interface::commandline" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-limma && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
