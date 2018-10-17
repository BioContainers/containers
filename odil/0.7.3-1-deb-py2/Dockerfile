FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="odil" \ 
    container="odil" \ 
    about.summary="C++11 library for the DICOM standard (Python wrappers)" \ 
    about.home="https://github.com/lamyj/odil" \ 
    software.version="0.7.3-1-deb-py2" \ 
    version="1" \ 
    about.copyright=" 2016 Julien Lamy <lamy@unistra.fr>" \ 
    about.license="CeCILL-B" \ 
    about.license_file="/usr/share/doc/odil/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-odil && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
