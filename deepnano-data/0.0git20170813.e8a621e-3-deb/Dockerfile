FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="deepnano-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="deepnano-data" \ 
    about.summary="alternative basecaller for MinION reads of genomic sequences (data)" \ 
    about.home="https://bitbucket.org/vboza/deepnano" \ 
    software.version="0.0git20170813.e8a621e-3-deb" \ 
    upstream.version="0.0" \ 
    version="1" \ 
    about.copyright="2016, Vladimir Boza, Comenius University" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/deepnano-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y deepnano-data || apt-get install -y deepnano-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
