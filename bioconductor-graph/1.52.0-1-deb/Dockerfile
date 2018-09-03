FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-graph" \ 
    container="bioconductor-graph" \ 
    about.summary="handle graph data structures for BioConductor" \ 
    about.home="https://bioconductor.org/packages/graph/" \ 
    software.version="1.52.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2002-2016 R. Gentleman, Laurent Gautier, Elizabeth Whalen, W. Huber, S. Falcon" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-graph/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-graph && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
