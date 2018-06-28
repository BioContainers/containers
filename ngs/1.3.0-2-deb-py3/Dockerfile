FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ngs" \ 
    container="ngs" \ 
    about.summary="Next Generation Sequencing language Bindings (Python3 bindings)" \ 
    about.home="https://github.com/ncbi/ngs" \ 
    software.version="1.3.0-2-deb-py3" \ 
    version="1" \ 
    about.copyright=" 2010-2015 National Center for Biotechnology Information" \ 
    about.license="public_domain" \ 
    about.license_file="/usr/share/doc/ngs/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-ngs && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
