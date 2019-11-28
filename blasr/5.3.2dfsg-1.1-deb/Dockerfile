FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="blasr" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="blasr" \ 
    about.summary="mapping single-molecule sequencing reads" \ 
    about.home="https://github.com/PacificBiosciences/blasr" \ 
    software.version="5.3.2dfsg-1.1-deb" \ 
    upstream.version="5.3.2" \ 
    version="1" \ 
    extra.identifiers.biotools="blasr" \ 
    about.copyright="2011-2016 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/blasr/copyright" \ 
    extra.binaries="/usr/bin/blasr,/usr/bin/sawriter" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y blasr || apt-get install -y blasr) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
