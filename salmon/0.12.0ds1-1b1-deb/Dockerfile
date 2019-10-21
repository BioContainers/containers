FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="salmon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="salmon" \ 
    about.summary="wicked-fast transcript quantification from RNA-seq data" \ 
    about.home="https://github.com/COMBINE-lab/salmon" \ 
    software.version="0.12.0ds1-1b1-deb" \ 
    upstream.version="0.12.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/salmon/copyright" \ 
    about.license_file="/usr/share/doc/salmon/copyright" \ 
    extra.binaries="/usr/bin/salmon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y salmon || apt-get install -y salmon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
