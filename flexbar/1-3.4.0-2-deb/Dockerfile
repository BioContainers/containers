FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="flexbar" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="flexbar" \ 
    about.summary="flexible barcode and adapter removal for sequencing platforms" \ 
    about.home="https://github.com/seqan/flexbar" \ 
    software.version="1-3.4.0-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="flexbar" \ 
    about.copyright=" 2012-2013 Matthias Dodt <matthias.dodt@googlemail.com>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/flexbar/copyright" \ 
    extra.binaries="/usr/bin/flexbar" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y flexbar || apt-get install -y flexbar) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
