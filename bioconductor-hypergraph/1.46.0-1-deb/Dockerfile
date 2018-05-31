FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-hypergraph" \ 
    container="bioconductor-hypergraph" \ 
    about.summary="BioConductor hypergraph data structures" \ 
    about.home="https://bioconductor.org/packages/hypergraph/" \ 
    software.version="1.46.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Seth Falcon, Robert Gentleman" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-hypergraph/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-hypergraph && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
