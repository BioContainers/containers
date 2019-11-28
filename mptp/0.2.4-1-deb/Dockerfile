FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mptp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mptp" \ 
    about.summary="single-locus species delimitation" \ 
    about.home="https://github.com/Pas-Kapli/mptp" \ 
    software.version="0.2.4-1-deb" \ 
    upstream.version="0.2.4" \ 
    version="1" \ 
    extra.identifiers.biotools="mptp" \ 
    about.copyright="2016-2017 Paschalia Kapli, Sarah Lutteropp, Kassian Kobert" \ 
    about.license="AFFERO-3" \ 
    about.license_file="/usr/share/doc/mptp/copyright" \ 
    extra.binaries="/usr/bin/mptp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mptp || apt-get install -y mptp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
