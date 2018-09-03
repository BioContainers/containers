FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-qvalue" \ 
    container="bioconductor-qvalue" \ 
    about.summary="GNU R package for Q-value estimation for FDR control" \ 
    about.home="https://bioconductor.org/packages/qvalue/" \ 
    software.version="2.6.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Alan Dabney and John D. Storey" \ 
    about.license="LGPL" \ 
    about.license_file="/usr/share/doc/bioconductor-qvalue/copyright" \ 
    about.tags="biology::peptidic, devel::lang:r, field::biology,:biology:bioinformatics,:medicine,:statistics,:r, interface::commandline, use::comparing,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-qvalue && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
