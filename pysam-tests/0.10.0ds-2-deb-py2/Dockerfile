FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pysam-tests" \ 
    container="pysam-tests" \ 
    about.summary="interface for the SAM/BAM sequence alignment and mapping format (test data)" \ 
    about.home="http://pysam.readthedocs.org/en/latest" \ 
    software.version="0.10.0ds-2-deb-py2" \ 
    version="1" \ 
    about.copyright="2009-2016 Andreas Heger," \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/pysam-tests/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-pysam-tests && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
