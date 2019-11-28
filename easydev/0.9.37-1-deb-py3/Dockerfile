FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="easydev" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="easydev" \ 
    about.summary="common utilities to ease the development of Python packages (Python 3)" \ 
    about.home="https://easydev-python.readthedocs.io/en/latest/" \ 
    software.version="0.9.37-1-deb-py3" \ 
    upstream.version="0.9.37" \ 
    version="1" \ 
    about.copyright="2011-2017 Thomas Cokelaer" \ 
    about.license="BSD-3-Clause/SKL" \ 
    about.license_file="/usr/share/doc/easydev/copyright" \ 
    extra.binaries="/usr/bin/easydev3_browse,/usr/bin/easydev3_buildPackage" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-easydev || apt-get install -y python3-easydev) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
