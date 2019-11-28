FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="profnet-prof" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="profnet-prof" \ 
    about.summary="neural network architecture for profacc" \ 
    about.home="http://www.predictprotein.org/" \ 
    software.version="1.0.22-6-deb" \ 
    upstream.version="1.0.22" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/profnet-prof/copyright" \ 
    extra.binaries="/usr/bin/profnet_prof" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y profnet-prof || apt-get install -y profnet-prof) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
