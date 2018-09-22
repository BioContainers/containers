FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-rbgl" \ 
    container="bioconductor-rbgl" \ 
    about.summary="R interface to the graph algorithms contained in the BOOST library" \ 
    about.home="https://bioconductor.org/packages/RBGL/" \ 
    software.version="1.50.0dfsg1-1-deb" \ 
    version="1" \ 
    about.copyright="2002-2016 Vince Carey <stvjc@channing.harvard.edu>, Li Long <li.long@isb-sib.ch>, R. Gentleman" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-rbgl/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-rbgl && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
