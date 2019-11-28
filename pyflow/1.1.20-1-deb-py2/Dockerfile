FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pyflow" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pyflow" \ 
    about.summary="lightweight parallel task engine for Python" \ 
    about.home="https://illumina.github.io/pyflow/" \ 
    software.version="1.1.20-1-deb-py2" \ 
    upstream.version="1.1.20" \ 
    version="1" \ 
    about.copyright="2012-2017 Illumina, Inc." \ 
    about.license="BSD-2-clause" \ 
    about.license_file="/usr/share/doc/pyflow/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pyflow || apt-get install -y python-pyflow) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
