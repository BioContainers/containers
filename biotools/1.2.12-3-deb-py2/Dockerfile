FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biotools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biotools" \ 
    about.summary="Python bioinformatics utilities for high-throughput genomic sequencing" \ 
    about.home="https://github.com/sonwell/biotools" \ 
    software.version="1.2.12-3-deb-py2" \ 
    upstream.version="1.2.12" \ 
    version="1" \ 
    about.copyright="2012-2017 Andrew Kassen <atkassen@gmail.com>" \ 
    about.license="BSD-2-clause" \ 
    about.license_file="/usr/share/doc/biotools/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-biotools || apt-get install -y python-biotools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
