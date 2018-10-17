FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="insighttoolkit4-python" \ 
    container="insighttoolkit4-python" \ 
    about.summary="Image processing toolkit for registration and segmentation - Python bindings" \ 
    about.home="http://www.itk.org/" \ 
    software.version="4.10.1-dfsg1-1.1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/insighttoolkit4-python/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y insighttoolkit4-python && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
