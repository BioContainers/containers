FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="burrito" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="burrito" \ 
    about.summary="Python 3 framework for wrapping and controlling command-line applications" \ 
    about.home="https://github.com/biocore/burrito" \ 
    software.version="0.9.1-3-deb-py3" \ 
    upstream.version="0.9.1" \ 
    version="1" \ 
    about.copyright="2014-2015 burrito development team <gregcaporaso@gmail.com>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/burrito/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-burrito || apt-get install -y python3-burrito) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
