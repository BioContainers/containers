FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="igor" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="igor" \ 
    about.summary="infers V(D)J recombination processes from sequencing data" \ 
    about.home="https://github.com/qmarcou/IGoR/" \ 
    software.version="1.3.0dfsg-1-deb" \ 
    upstream.version="1.3.0" \ 
    version="1" \ 
    about.copyright="2015-2017 Quentin Marcou" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/igor/copyright" \ 
    extra.binaries="/usr/bin/igor" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y igor || apt-get install -y igor) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
