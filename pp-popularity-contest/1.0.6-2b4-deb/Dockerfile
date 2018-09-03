FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pp-popularity-contest" \ 
    container="pp-popularity-contest" \ 
    about.summary="PredictProtein popularity contest" \ 
    about.home="http://predictprotein.org/" \ 
    software.version="1.0.6-2b4-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/pp-popularity-contest/copyright" \ 
    extra.binaries="/usr/bin/pp_popcon_cnt" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pp-popularity-contest && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
