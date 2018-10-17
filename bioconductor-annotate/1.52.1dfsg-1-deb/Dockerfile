FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-annotate" \ 
    container="bioconductor-annotate" \ 
    about.summary="BioConductor annotation for microarrays" \ 
    about.home="https://bioconductor.org/packages/annotate/" \ 
    software.version="1.52.1dfsg-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 R. Gentleman" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-annotate/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-annotate && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
