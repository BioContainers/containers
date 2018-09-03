FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sumtrees" \ 
    container="sumtrees" \ 
    about.summary="Phylogenetic Tree Summarization and Annotation" \ 
    about.home="http://dendropy.org/" \ 
    software.version="4.2.0dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2014 Jeet Sukumaran <jeetsukumaran@gmail.com>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/sumtrees/copyright" \ 
    extra.binaries="/usr/bin/sumtrees" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sumtrees && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
