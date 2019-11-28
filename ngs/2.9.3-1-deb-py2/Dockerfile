FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ngs" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ngs" \ 
    about.summary="Next Generation Sequencing language Bindings (Python bindings)" \ 
    about.home="https://github.com/ncbi/ngs" \ 
    software.version="2.9.3-1-deb-py2" \ 
    upstream.version="2.9.3" \ 
    version="1" \ 
    about.copyright=" 2010-2015 National Center for Biotechnology Information" \ 
    about.license="public_domain" \ 
    about.license_file="/usr/share/doc/ngs/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-ngs || apt-get install -y python-ngs) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
