FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gffutils" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gffutils" \ 
    about.summary="Work with GFF and GTF files in a flexible database framework" \ 
    about.home="https://daler.github.io/gffutils" \ 
    software.version="0.9-1-deb-py3" \ 
    upstream.version="0.9" \ 
    version="1" \ 
    about.copyright="2013 Ryan Dale" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/gffutils/copyright" \ 
    extra.binaries="/usr/bin/gffutils-cli" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-gffutils || apt-get install -y python3-gffutils) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
