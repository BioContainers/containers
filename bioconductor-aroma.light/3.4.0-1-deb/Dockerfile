FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-aroma.light" \ 
    container="bioconductor-aroma.light" \ 
    about.summary="BioConductor methods normalization and visualization of microarray data" \ 
    about.home="https://bioconductor.org/packages/aroma.light/" \ 
    software.version="3.4.0-1-deb" \ 
    version="1" \ 
    about.copyright="2006-2016 Henrik Bengtsson <henrikb@braju.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/bioconductor-aroma.light/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-aroma.light && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
