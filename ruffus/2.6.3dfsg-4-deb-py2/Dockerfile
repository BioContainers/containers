FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ruffus" \ 
    container="ruffus" \ 
    about.summary="Python computation pipeline library widely used in bioinformatics" \ 
    about.home="http://www.ruffus.org.uk/" \ 
    software.version="2.6.3dfsg-4-deb-py2" \ 
    version="1" \ 
    about.copyright=" 2010-2014 Leo Goodstadt <ruffus_lib@llew.org.uk>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/ruffus/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-ruffus && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
