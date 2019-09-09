FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cfflib" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cfflib" \ 
    about.summary="Multi-modal connectome and metadata management and integration" \ 
    about.home="http://cmtk.org/cfflib" \ 
    software.version="2.0.5-3-deb-py2" \ 
    upstream.version="2.0.5" \ 
    version="1" \ 
    about.copyright="2009-2011, Ecole Polytechnique Fdrale de Lausanne (EPFL) and" \ 
    about.license="BSD-3" \ 
    about.license_file="/usr/share/doc/cfflib/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-cfflib || apt-get install -y python-cfflib) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
