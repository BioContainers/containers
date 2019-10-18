FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbcore" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbcore" \ 
    about.summary="Python 2 library for processing PacBio data files" \ 
    about.home="https://github.com/PacificBiosciences/pbcore" \ 
    software.version="1.6.5dfsg-1-deb-py2" \ 
    upstream.version="1.6.5" \ 
    version="1" \ 
    about.copyright="2011-2015 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbcore/copyright" \ 
    extra.binaries="/usr/bin/pbopen" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pbcore || apt-get install -y python-pbcore) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
