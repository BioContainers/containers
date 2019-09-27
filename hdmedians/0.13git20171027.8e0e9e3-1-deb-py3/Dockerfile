FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hdmedians" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="hdmedians" \ 
    about.summary="high-dimensional medians in Python3" \ 
    about.home="https://github.com/daleroberts/hdmedians" \ 
    software.version="0.13git20171027.8e0e9e3-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2015-2017 Dale Roberts <dale.o.roberts@gmail.com>" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/hdmedians/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-hdmedians || apt-get install -y python3-hdmedians) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
