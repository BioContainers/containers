FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="transdecoder" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="transdecoder" \ 
    about.summary="find coding regions within RNA transcript sequences" \ 
    about.home="https://transdecoder.github.io/" \ 
    software.version="5.0.1-2-deb" \ 
    upstream.version="5.0.1" \ 
    version="1" \ 
    about.copyright="(c) 2012, The Broad Institute, Inc. All rights reserved." \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/transdecoder/copyright" \ 
    extra.binaries="/usr/bin/TransDecoder.LongOrfs,/usr/bin/TransDecoder.Predict" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y transdecoder || apt-get install -y transdecoder) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
