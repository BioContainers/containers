FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pp-popularity-contest" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pp-popularity-contest" \ 
    about.summary="PredictProtein popularity contest" \ 
    about.home="http://predictprotein.org/" \ 
    software.version="1.0.6-4b1-deb" \ 
    upstream.version="1.0.6" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/pp-popularity-contest/copyright" \ 
    about.license_file="/usr/share/doc/pp-popularity-contest/copyright" \ 
    extra.binaries="/usr/bin/pp_popcon_cnt" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pp-popularity-contest || apt-get install -y pp-popularity-contest) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
