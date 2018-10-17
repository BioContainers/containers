FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-interactivedisplaybase" \ 
    container="bioconductor-interactivedisplaybase" \ 
    about.summary="base package for enabling powerful shiny web displays of Bioconductor objects" \ 
    about.home="https://bioconductor.org/packages/interactiveDisplayBase/" \ 
    software.version="1.12.0-1-deb" \ 
    version="1" \ 
    about.copyright="2006-2016 Shawn Balcome, Marc Carlson" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-interactivedisplaybase/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-interactivedisplaybase && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
