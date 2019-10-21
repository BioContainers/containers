FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rapmap-dev" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rapmap-dev" \ 
    about.summary="rapmap - rapid sensitive and accurate DNA read mapping (some headers)" \ 
    about.home="https://github.com/COMBINE-lab/RapMap" \ 
    software.version="0.12.0dfsg-3-deb" \ 
    upstream.version="0.12.0" \ 
    version="1" \ 
    extra.identifiers.biotools="rapmap" \ 
    about.copyright="2014-2016 COMputational BIology and Network Evolution lab" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/rapmap-dev/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rapmap-dev || apt-get install -y rapmap-dev) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
