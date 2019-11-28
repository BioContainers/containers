FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="xopen" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="xopen" \ 
    about.summary="Python module to open compressed files transparently" \ 
    about.home="https://github.com/marcelm/xopen" \ 
    software.version="0.5.0-2-deb-py2" \ 
    upstream.version="0.5.0" \ 
    version="1" \ 
    about.copyright="2010-2016 Marcel Martin <mail@marcelm.net>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/xopen/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-xopen || apt-get install -y python-xopen) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
