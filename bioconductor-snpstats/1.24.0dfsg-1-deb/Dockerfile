FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-snpstats" \ 
    container="bioconductor-snpstats" \ 
    about.summary="BioConductor SnpMatrix and XSnpMatrix classes and methods" \ 
    about.home="https://bioconductor.org/packages/snpStats/" \ 
    software.version="1.24.0dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2006-2016 David Clayton <dc208@cam.ac.uk>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/bioconductor-snpstats/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-snpstats && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
