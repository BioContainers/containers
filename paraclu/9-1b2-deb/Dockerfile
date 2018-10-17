FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="paraclu" \ 
    container="paraclu" \ 
    about.summary="Parametric clustering of genomic and transcriptomic features" \ 
    about.home="http://www.cbrc.jp/paraclu/" \ 
    software.version="9-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/paraclu/copyright" \ 
    extra.binaries="/usr/bin/paraclu,/usr/bin/paraclu-cut.sh" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y paraclu && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
