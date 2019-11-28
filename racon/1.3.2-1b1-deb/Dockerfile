FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="racon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="racon" \ 
    about.summary="consensus module for raw de novo DNA assembly of long uncorrected reads" \ 
    about.home="https://github.com/isovic/racon" \ 
    software.version="1.3.2-1b1-deb" \ 
    upstream.version="1.3.2" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/racon/copyright" \ 
    about.license_file="/usr/share/doc/racon/copyright" \ 
    extra.binaries="/usr/bin/racon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y racon || apt-get install -y racon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
