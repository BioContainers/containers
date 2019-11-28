FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bx" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bx" \ 
    about.summary="library to manage genomic data and its alignment" \ 
    about.home="https://github.com/bxlab/bx-python" \ 
    software.version="0.8.2-1-deb-py3" \ 
    upstream.version="0.8.2" \ 
    version="1" \ 
    about.copyright="2005-2015 The Pennsylvania State University" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/bx/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-bx || apt-get install -y python3-bx) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
