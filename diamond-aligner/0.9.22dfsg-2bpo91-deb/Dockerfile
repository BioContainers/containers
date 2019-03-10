FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="diamond-aligner" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="diamond-aligner" \ 
    about.summary="accelerated BLAST compatible local sequence aligner" \ 
    about.home="https://github.com/bbuchfink/diamond" \ 
    software.version="0.9.22dfsg-2bpo91-deb" \ 
    upstream.version="0.9.22" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/diamond-aligner/copyright" \ 
    about.license_file="/usr/share/doc/diamond-aligner/copyright" \ 
    extra.binaries="/usr/bin/diamond-aligner" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y diamond-aligner && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
