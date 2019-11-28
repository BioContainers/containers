FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spoa" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="spoa" \ 
    about.summary="SIMD partial order alignment tool" \ 
    about.home="https://github.com/rvaser/spoa" \ 
    software.version="1.1.5-1-deb" \ 
    upstream.version="1.1.5" \ 
    version="1" \ 
    about.copyright="2016-2018 Robert Vaser" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/spoa/copyright" \ 
    extra.binaries="/usr/bin/spoa" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y spoa || apt-get install -y spoa) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
