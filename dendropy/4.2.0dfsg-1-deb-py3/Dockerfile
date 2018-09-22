FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dendropy" \ 
    container="dendropy" \ 
    about.summary="DendroPy Phylogenetic Computing Library (Python 3)" \ 
    about.home="http://dendropy.org/" \ 
    software.version="4.2.0dfsg-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2014 Jeet Sukumaran <jeetsukumaran@gmail.com>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/dendropy/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-dendropy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
