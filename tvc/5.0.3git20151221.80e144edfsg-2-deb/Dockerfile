FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tvc" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="tvc" \ 
    about.summary="genetic variant caller for Ion Torrent sequencing platforms" \ 
    about.home="http://ioncommunity.thermofisher.com" \ 
    software.version="5.0.3git20151221.80e144edfsg-2-deb" \ 
    upstream.version="5.0.3" \ 
    version="1" \ 
    about.copyright="2010-2014 Ion Torrent Systems, Inc." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/tvc/copyright" \ 
    extra.binaries="/usr/bin/tvc,/usr/bin/tvcassembly,/usr/bin/tvcutils,/usr/bin/variant_caller_pipeline.py" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y tvc || apt-get install -y tvc) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
