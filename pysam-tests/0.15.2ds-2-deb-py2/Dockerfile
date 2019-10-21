FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pysam-tests" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pysam-tests" \ 
    about.summary="interface for the SAM/BAM sequence alignment and mapping format (test data)" \ 
    about.home="http://pysam.readthedocs.org/en/latest" \ 
    software.version="0.15.2ds-2-deb-py2" \ 
    upstream.version="0.15.2" \ 
    version="1" \ 
    about.copyright="2009-2018 Andreas Heger," \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/pysam-tests/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pysam-tests || apt-get install -y python-pysam-tests) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
