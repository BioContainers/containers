FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="transdecoder" \ 
    container="transdecoder" \ 
    about.summary="find coding regions within RNA transcript sequences" \ 
    about.home="https://transdecoder.github.io/" \ 
    software.version="3.0.1dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="(c) 2012, The Broad Institute, Inc. All rights reserved." \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/transdecoder/copyright" \ 
    extra.binaries="/usr/bin/TransDecoder.LongOrfs,/usr/bin/TransDecoder.Predict" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y transdecoder && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
