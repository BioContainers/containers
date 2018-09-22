FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-multtest" \ 
    container="bioconductor-multtest" \ 
    about.summary="Bioconductor resampling-based multiple hypothesis testing" \ 
    about.home="https://bioconductor.org/packages//multtest/" \ 
    software.version="2.30.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Katherine S. Pollard, Houston N. Gilbert, Yongchao Ge, Sandra Taylor, Sandrine Dudoit" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/bioconductor-multtest/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-multtest && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
