FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="galileo-daemon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="galileo-daemon" \ 
    about.summary="Utility to securely synchronize a Fitbit device - daemon" \ 
    about.home="https://bitbucket.org/benallard/galileo/" \ 
    software.version="0.5.1-6-deb" \ 
    upstream.version="0.5.1" \ 
    version="1" \ 
    about.copyright="2013-2016 Benot Allard" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/galileo-daemon/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y galileo-daemon || apt-get install -y galileo-daemon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
