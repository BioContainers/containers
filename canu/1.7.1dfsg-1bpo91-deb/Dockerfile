FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="canu" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="canu" \ 
    about.summary="single molecule sequence assembler for genomes" \ 
    about.home="http://canu.readthedocs.org/en/latest/" \ 
    software.version="1.7.1dfsg-1bpo91-deb" \ 
    upstream.version="1.7.1" \ 
    version="1" \ 
    extra.identifiers.biotools="canu" \ 
    about.license="custom, see /usr/share/doc/canu/copyright" \ 
    about.license_file="/usr/share/doc/canu/copyright" \ 
    extra.binaries="/usr/bin/canu" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -t stretch-backports -y canu && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
