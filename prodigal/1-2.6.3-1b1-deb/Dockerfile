FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="prodigal" \ 
    container="prodigal" \ 
    about.summary="Microbial (bacterial and archaeal) gene finding program" \ 
    about.home="http://prodigal.ornl.gov/" \ 
    software.version="1-2.6.3-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/prodigal/copyright" \ 
    extra.binaries="/usr/bin/prodigal" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y prodigal && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
