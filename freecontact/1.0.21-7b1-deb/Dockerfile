FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freecontact" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="freecontact" \ 
    about.summary="fast protein contact predictor" \ 
    about.home="http://rostlab.org/" \ 
    software.version="1.0.21-7b1-deb" \ 
    upstream.version="1.0.21" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/freecontact/copyright" \ 
    about.license_file="/usr/share/doc/freecontact/copyright" \ 
    extra.binaries="/usr/bin/freecontact" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y freecontact || apt-get install -y freecontact) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
