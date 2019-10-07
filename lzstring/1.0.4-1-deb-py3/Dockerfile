FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="lzstring" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="lzstring" \ 
    about.summary="LZ-based compression algorithm for Python (Python 3 version)" \ 
    about.home="https://pypi.org/project/lzstring/" \ 
    software.version="1.0.4-1-deb-py3" \ 
    upstream.version="1.0.4" \ 
    version="1" \ 
    about.copyright="2014-2015, eduardtomasek" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/lzstring/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-lzstring || apt-get install -y python3-lzstring) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
