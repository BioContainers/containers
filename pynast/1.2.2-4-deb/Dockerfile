FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pynast" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pynast" \ 
    about.summary="alignment of short DNA sequences" \ 
    about.home="https://github.com/biocore/pynast" \ 
    software.version="1.2.2-4-deb" \ 
    upstream.version="1.2.2" \ 
    version="1" \ 
    about.copyright="2010-2013 PyNAST Development Team" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/pynast/copyright" \ 
    extra.binaries="/usr/bin/pynast" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pynast || apt-get install -y pynast) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
