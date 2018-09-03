FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-hilbertvis" \ 
    container="bioconductor-hilbertvis" \ 
    about.summary="GNU R package to visualise long vector data" \ 
    about.home="https://bioconductor.org/packages/HilbertVis" \ 
    software.version="1.32.0-1-deb" \ 
    version="1" \ 
    about.copyright="2009-2016 Simon Anders <sanders@fs.tum.de>;" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/bioconductor-hilbertvis/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::r,:analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-hilbertvis && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
