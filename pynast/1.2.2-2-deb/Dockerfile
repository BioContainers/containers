FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pynast" \ 
    container="pynast" \ 
    about.summary="alignment of short DNA sequences" \ 
    about.home="http://pynast.sourceforge.net/" \ 
    software.version="1.2.2-2-deb" \ 
    version="1" \ 
    about.copyright="2010-2013 PyNAST Development Team" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/pynast/copyright" \ 
    extra.binaries="/usr/bin/pynast" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pynast && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
