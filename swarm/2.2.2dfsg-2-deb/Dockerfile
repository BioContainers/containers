FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="swarm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="swarm" \ 
    about.summary="robust and fast clustering method for amplicon-based studies" \ 
    about.home="https://github.com/torognes/swarm" \ 
    software.version="2.2.2dfsg-2-deb" \ 
    upstream.version="2.2.2" \ 
    version="1" \ 
    about.copyright="(C) 2012-2015 Torbjrn Rognes and Frederic Mahe" \ 
    about.license="Affero-GPL-3" \ 
    about.license_file="/usr/share/doc/swarm/copyright" \ 
    extra.binaries="/usr/bin/swarm" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y swarm || apt-get install -y swarm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
