FROM biocontainers/biocontainers:debian-stretch-backports_cv2
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="jellyfish1" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports_cv2" \ 
    container="jellyfish1" \ 
    about.summary="count k-mers in DNA sequences" \ 
    about.home="http://www.cbcb.umd.edu/software/jellyfish/" \ 
    software.version="1.1.11-3bpo91-deb" \ 
    upstream.version="1.1.11" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/jellyfish1/copyright" \ 
    about.license_file="/usr/share/doc/jellyfish1/copyright" \ 
    extra.binaries="/usr/bin/jellyfish1" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y jellyfish1 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
