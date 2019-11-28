FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="subread-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="subread-data" \ 
    about.summary="data files for subread package" \ 
    about.home="http://sourceforge.net/projects/subread/" \ 
    software.version="1.6.3dfsg-1-deb" \ 
    upstream.version="1.6.3" \ 
    version="1" \ 
    extra.identifiers.biotools="subread" \ 
    about.copyright="2011-2018, Dr Yang Liao, Dr Wei Shi" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/subread-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y subread-data || apt-get install -y subread-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
