FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dendropy" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dendropy" \ 
    about.summary="DendroPy Phylogenetic Computing Library (Python 3)" \ 
    about.home="http://dendropy.org/" \ 
    software.version="4.4.0-1-deb-py3" \ 
    upstream.version="4.4.0" \ 
    version="1" \ 
    about.copyright="2014 Jeet Sukumaran <jeetsukumaran@gmail.com>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/dendropy/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-dendropy || apt-get install -y python3-dendropy) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
