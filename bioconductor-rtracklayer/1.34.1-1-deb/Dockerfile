FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-rtracklayer" \ 
    container="bioconductor-rtracklayer" \ 
    about.summary="GNU R interface to genome browsers and their annotation tracks" \ 
    about.home="https://bioconductor.org/packages/rtracklayer/" \ 
    software.version="1.34.1-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Michael Lawrence, Vince Carey, Robert Gentleman" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-rtracklayer/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-rtracklayer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
