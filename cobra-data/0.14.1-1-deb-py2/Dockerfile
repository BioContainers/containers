FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cobra-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cobra-data" \ 
    about.summary="constraint-based modeling of biological networks (data)" \ 
    about.home="http://opencobra.github.io/cobrapy/" \ 
    software.version="0.14.1-1-deb-py2" \ 
    upstream.version="0.14.1" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+ or LGPL-2.0+" \ 
    about.license_file="/usr/share/doc/cobra-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-cobra-data || apt-get install -y python-cobra-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
