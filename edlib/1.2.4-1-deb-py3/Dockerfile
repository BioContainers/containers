FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="edlib" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="edlib" \ 
    about.summary="library for sequence alignment using edit distance (Python3 module)" \ 
    about.home="https://github.com/Martinsos/edlib" \ 
    software.version="1.2.4-1-deb-py3" \ 
    upstream.version="1.2.4" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/edlib/copyright" \ 
    about.license_file="/usr/share/doc/edlib/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-edlib || apt-get install -y python3-edlib) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
