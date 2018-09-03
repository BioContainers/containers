FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-altcdfenvs" \ 
    container="bioconductor-altcdfenvs" \ 
    about.summary="BioConductor alternative CDF environments" \ 
    about.home="https://bioconductor.org/packages/altcdfenvs/" \ 
    software.version="1-2.36.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Laurent Gautier <lgautier@gmail.com>" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-altcdfenvs/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-altcdfenvs && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
