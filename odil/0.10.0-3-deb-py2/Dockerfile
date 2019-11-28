FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="odil" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="odil" \ 
    about.summary="C++11 library for the DICOM standard (Python wrappers)" \ 
    about.home="https://github.com/lamyj/odil" \ 
    software.version="0.10.0-3-deb-py2" \ 
    upstream.version="0.10.0" \ 
    version="1" \ 
    about.copyright=" 2018 Universit de Strasbourg" \ 
    about.license="CeCILL-B" \ 
    about.license_file="/usr/share/doc/odil/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-odil || apt-get install -y python-odil) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
