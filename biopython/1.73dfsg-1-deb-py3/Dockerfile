FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biopython" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biopython" \ 
    about.summary="Python library for bioinformatics (implemented in Python 3)" \ 
    about.home="http://biopython.org" \ 
    software.version="1.73dfsg-1-deb-py3" \ 
    upstream.version="1.73" \ 
    version="1" \ 
    about.copyright=" 2002-2009 Biopython contributors" \ 
    about.license="other" \ 
    about.license_file="/usr/share/doc/biopython/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-biopython || apt-get install -y python3-biopython) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
