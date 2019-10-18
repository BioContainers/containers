FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbbanana" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbbanana" \ 
    about.summary="additional utilities for the pbsuite" \ 
    about.home="http://sourceforge.net/projects/pb-jelly" \ 
    software.version="15.8.24dfsg-3-deb-py2" \ 
    upstream.version="15.8.24" \ 
    version="1" \ 
    about.copyright="2013 Baylor College of Medicine" \ 
    about.license="BSD-2-Clause" \ 
    about.license_file="/usr/share/doc/pbbanana/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pbbanana || apt-get install -y python-pbbanana) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
