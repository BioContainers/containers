FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="colormath" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="colormath" \ 
    about.summary="Abstracts common color math operations (Python 3 version)" \ 
    about.home="https://pypi.org/project/colormath/" \ 
    software.version="3.0.0-1-deb-py3" \ 
    upstream.version="3.0.0" \ 
    version="1" \ 
    about.copyright="2008-2018, Gregory Taylor" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/colormath/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-colormath || apt-get install -y python3-colormath) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
