FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ruffus" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ruffus" \ 
    about.summary="Python3 computation pipeline library widely used in bioinformatics" \ 
    about.home="http://www.ruffus.org.uk/" \ 
    software.version="2.8.1-4-deb-py3" \ 
    upstream.version="2.8.1" \ 
    version="1" \ 
    about.copyright=" 2010-2014 Leo Goodstadt <ruffus_lib@llew.org.uk>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/ruffus/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-ruffus || apt-get install -y python3-ruffus) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
