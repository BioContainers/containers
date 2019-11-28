FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="salmid" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="salmid" \ 
    about.summary="rapid Kmer based Salmonella identifier from sequence data" \ 
    about.home="https://github.com/hcdenbakker/SalmID" \ 
    software.version="0.1.23-1bpo91-deb" \ 
    upstream.version="0.1.23" \ 
    version="2" \ 
    about.license="custom, see /usr/share/doc/salmid/copyright" \ 
    about.license_file="/usr/share/doc/salmid/copyright" \ 
    extra.binaries="/usr/bin/SalmID" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -t stretch-backports -y salmid && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
