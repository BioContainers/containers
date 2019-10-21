FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spectra" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="spectra" \ 
    about.summary="Easy color scales and color conversion for Python (Python 3 version)" \ 
    about.home="https://pypi.org/project/spectra/" \ 
    software.version="0.0.11-1-deb-py3" \ 
    upstream.version="0.0.11" \ 
    version="1" \ 
    about.copyright="2015-2018, Jeremy Singer-Vine" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/spectra/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-spectra || apt-get install -y python3-spectra) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
