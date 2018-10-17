FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-dnacopy" \ 
    container="bioconductor-dnacopy" \ 
    about.summary="R package: DNA copy number data analysis" \ 
    about.home="http://www.bioconductor.org/packages/DNAcopy/" \ 
    software.version="1.48.0-1-deb" \ 
    version="1" \ 
    about.copyright="Venkatraman E. Seshan <seshanv@mskcc.org>" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/bioconductor-dnacopy/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-dnacopy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
