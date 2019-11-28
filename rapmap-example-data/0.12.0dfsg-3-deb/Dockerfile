FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rapmap-example-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rapmap-example-data" \ 
    about.summary="example data for rapmap - rapid sensitive and accurate DNA read mapping" \ 
    about.home="https://github.com/COMBINE-lab/RapMap" \ 
    software.version="0.12.0dfsg-3-deb" \ 
    upstream.version="0.12.0" \ 
    version="1" \ 
    extra.identifiers.biotools="rapmap" \ 
    about.copyright="2014-2016 COMputational BIology and Network Evolution lab" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/rapmap-example-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rapmap-example-data || apt-get install -y rapmap-example-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
