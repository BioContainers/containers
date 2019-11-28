FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biotools" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="biotools" \ 
    about.summary="Python3 bioinformatics utilities for high-throughput genomic sequencing" \ 
    about.home="https://github.com/sonwell/biotools" \ 
    software.version="1.2.12-3bpo91-deb-py3" \ 
    upstream.version="1.2.12" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/biotools/copyright" \ 
    about.license_file="/usr/share/doc/biotools/copyright" \ 
    extra.binaries="/usr/bin/grepseq,/usr/bin/prok-geneseek" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-biotools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
