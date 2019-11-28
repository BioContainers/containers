FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="unicycler-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="unicycler-data" \ 
    about.summary="hybrid assembly pipeline for bacterial genomes (data package)" \ 
    about.home="https://github.com/rrwick/Unicycler" \ 
    software.version="0.4.7dfsg-2-deb" \ 
    upstream.version="0.4.7" \ 
    version="1" \ 
    extra.identifiers.biotools="unicycler" \ 
    about.copyright="2016-2018 Ryan R. Wick, Louise M. Judd, Claire L. Gorrie, Kathryn E. Holt" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/unicycler-data/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y unicycler-data || apt-get install -y unicycler-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
