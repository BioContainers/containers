FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qcli" \ 
    container="qcli" \ 
    about.summary="separated module of pyqi needed for QIIME package" \ 
    about.home="https://pypi.python.org/pypi/qcli/0.1.0" \ 
    software.version="0.1.1-1-deb-py2" \ 
    version="1" \ 
    about.copyright="2013-2014 Greg Caporaso <gregcaporaso@gmail.com>" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/qcli/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-qcli && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
