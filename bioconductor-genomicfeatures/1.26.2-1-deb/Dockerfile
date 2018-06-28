FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-genomicfeatures" \ 
    container="bioconductor-genomicfeatures" \ 
    about.summary="GNU R tools for making and manipulating transcript centric annotations" \ 
    about.home="https://bioconductor.org/packages/GenomicFeatures/" \ 
    software.version="1.26.2-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 M. Carlson, H. Pages, P. Aboyoun, S. Falcon, M. Morgan, D. Sarkar, M. Lawrence" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-genomicfeatures/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-genomicfeatures && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
