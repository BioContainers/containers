FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="insighttoolkit4-python" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="insighttoolkit4-python" \ 
    about.summary="Image processing toolkit for registration and segmentation - Python bindings" \ 
    about.home="http://www.itk.org/" \ 
    software.version="4.12.2-dfsg1-4b1-deb" \ 
    upstream.version="4.12.2" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/insighttoolkit4-python/copyright" \ 
    about.license_file="/usr/share/doc/insighttoolkit4-python/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y insighttoolkit4-python || apt-get install -y insighttoolkit4-python) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
