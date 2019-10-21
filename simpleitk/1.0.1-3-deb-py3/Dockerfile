FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="simpleitk" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="simpleitk" \ 
    about.summary="Python bindings for SimpleITK" \ 
    about.home="http://www.simpleitk.org/" \ 
    software.version="1.0.1-3-deb-py3" \ 
    upstream.version="1.0.1" \ 
    version="1" \ 
    about.copyright="Insight Software Consortium" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/simpleitk/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-simpleitk || apt-get install -y python3-simpleitk) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
