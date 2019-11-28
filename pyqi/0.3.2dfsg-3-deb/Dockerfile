FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pyqi" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pyqi" \ 
    about.summary="Python framework for wrapping general commands in multiple interfaces" \ 
    about.home="https://pypi.python.org/pypi/pyqi/" \ 
    software.version="0.3.2dfsg-3-deb" \ 
    upstream.version="0.3.2" \ 
    version="1" \ 
    about.copyright="2013 BiPy Development Team <gregcaporaso@gmail.com>" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/pyqi/copyright" \ 
    extra.binaries="/usr/bin/pyqi" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pyqi || apt-get install -y pyqi) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
