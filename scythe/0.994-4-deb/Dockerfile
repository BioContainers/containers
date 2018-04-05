FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="scythe" \ 
    container="scythe" \ 
    about.summary="Bayesian adaptor trimmer for sequencing reads" \ 
    about.home="https://github.com/vsbuffalo/scythe" \ 
    software.version="0.994-4-deb" \ 
    version="1" \ 
    about.copyright="2011 Vince Buffalo" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/scythe/copyright" \ 
    extra.binaries="/usr/bin/scythe" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y scythe && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
