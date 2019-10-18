FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mustang" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mustang" \ 
    about.summary="multiple structural alignment of proteins" \ 
    about.home="http://lcb.infotech.monash.edu.au/mustang/" \ 
    software.version="3.2.3-3-deb" \ 
    upstream.version="3.2.3" \ 
    version="1" \ 
    extra.identifiers.biotools="mustang" \ 
    about.copyright="2005-2009 Arun S Konagurthu <arun@bx.psu.edu>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/mustang/copyright" \ 
    extra.binaries="/usr/bin/mustang" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c++, interface::commandline, role::program,:analysing,:comparing, works-with-format::plaintext" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mustang || apt-get install -y mustang) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
