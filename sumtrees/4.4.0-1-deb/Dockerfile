FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sumtrees" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sumtrees" \ 
    about.summary="Phylogenetic Tree Summarization and Annotation" \ 
    about.home="http://dendropy.org/" \ 
    software.version="4.4.0-1-deb" \ 
    upstream.version="4.4.0" \ 
    version="1" \ 
    about.copyright="2014 Jeet Sukumaran <jeetsukumaran@gmail.com>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/sumtrees/copyright" \ 
    extra.binaries="/usr/bin/sumtrees" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sumtrees || apt-get install -y sumtrees) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
