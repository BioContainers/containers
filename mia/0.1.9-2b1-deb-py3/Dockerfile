FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mia" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mia" \ 
    about.summary="Python-3 bindings for the MIA image processing library" \ 
    about.home="http://mia.sourceforge.net" \ 
    software.version="0.1.9-2b1-deb-py3" \ 
    upstream.version="0.1.9" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/mia/copyright" \ 
    about.license_file="/usr/share/doc/mia/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-mia || apt-get install -y python3-mia) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
