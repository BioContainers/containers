FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="salmon" \ 
    container="salmon" \ 
    about.summary="wicked-fast transcript quantification from RNA-seq data" \ 
    about.home="https://github.com/COMBINE-lab/salmon" \ 
    software.version="0.7.2ds1-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/salmon/copyright" \ 
    extra.binaries="/usr/bin/salmon" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y salmon && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
