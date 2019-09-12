FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fast5" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fast5" \ 
    about.summary="library for reading Oxford Nanopore Fast5 files -- Python 2" \ 
    about.home="https://github.com/mateidavid/fast5" \ 
    software.version="0.6.5-2b1-deb-py2" \ 
    upstream.version="0.6.5" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/fast5/copyright" \ 
    about.license_file="/usr/share/doc/fast5/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-fast5 || apt-get install -y python-fast5) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
