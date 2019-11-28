FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qcli" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="qcli" \ 
    about.summary="separated module of pyqi needed for QIIME package" \ 
    about.home="https://pypi.python.org/pypi/qcli/" \ 
    software.version="0.1.1-3-deb-py2" \ 
    upstream.version="0.1.1" \ 
    version="1" \ 
    about.copyright="2013-2014 Greg Caporaso <gregcaporaso@gmail.com>" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/qcli/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-qcli || apt-get install -y python-qcli) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
