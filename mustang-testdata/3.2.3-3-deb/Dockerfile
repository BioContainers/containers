FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mustang-testdata" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mustang-testdata" \ 
    about.summary="multiple structural alignment of proteins, test data" \ 
    about.home="http://lcb.infotech.monash.edu.au/mustang/" \ 
    software.version="3.2.3-3-deb" \ 
    upstream.version="3.2.3" \ 
    version="1" \ 
    extra.identifiers.biotools="mustang" \ 
    about.copyright="2005-2009 Arun S Konagurthu <arun@bx.psu.edu>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/mustang-testdata/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mustang-testdata || apt-get install -y mustang-testdata) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
