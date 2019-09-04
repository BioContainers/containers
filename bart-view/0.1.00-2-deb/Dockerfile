FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bart-view" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bart-view" \ 
    about.summary="viewer for multi-dimensional complex-valued data" \ 
    about.home="https://github.com/mrirecon/view/" \ 
    software.version="0.1.00-2-deb" \ 
    upstream.version="0.1.00" \ 
    version="1" \ 
    about.copyright="2015-2018 Martin Uecker" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/bart-view/copyright" \ 
    about.tags="uitoolkit::gtk" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bart-view || apt-get install -y bart-view) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
