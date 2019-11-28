FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="profphd-net" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="profphd-net" \ 
    about.summary="neural network architecture for profphd" \ 
    about.home="http://www.predictprotein.org/" \ 
    software.version="1.0.22-6-deb" \ 
    upstream.version="1.0.22" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/profphd-net/copyright" \ 
    extra.binaries="/usr/bin/phd1994,/usr/bin/profphd_net" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y profphd-net || apt-get install -y profphd-net) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
