FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hilive" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="hilive" \ 
    about.summary="realtime alignment of Illumina reads" \ 
    about.home="https://gitlab.com/SimonHTausch/HiLive" \ 
    software.version="1.1-2-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    about.copyright="2015 Martin S. Lindner <marzin@mail-lindner.de>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/hilive/copyright" \ 
    extra.binaries="/usr/bin/hilive,/usr/bin/hilive-build" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y hilive || apt-get install -y hilive) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
