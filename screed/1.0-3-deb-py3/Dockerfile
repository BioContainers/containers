FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="screed" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="screed" \ 
    about.summary="short nucleotide read sequence utils in Python 3" \ 
    about.home="https://screed.readthedocs.org" \ 
    software.version="1.0-3-deb-py3" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    about.copyright="2008-2014 Michigan State University" \ 
    about.license="BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/screed/copyright" \ 
    extra.binaries="/usr/bin/screed" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-screed || apt-get install -y python3-screed) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
