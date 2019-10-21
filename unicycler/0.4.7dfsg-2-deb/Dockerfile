FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="unicycler" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="unicycler" \ 
    about.summary="hybrid assembly pipeline for bacterial genomes" \ 
    about.home="https://github.com/rrwick/Unicycler" \ 
    software.version="0.4.7dfsg-2-deb" \ 
    upstream.version="0.4.7" \ 
    version="1" \ 
    extra.identifiers.biotools="unicycler" \ 
    about.copyright="2016-2018 Ryan R. Wick, Louise M. Judd, Claire L. Gorrie, Kathryn E. Holt" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/unicycler/copyright" \ 
    extra.binaries="/usr/bin/unicycler,/usr/bin/unicycler_align,/usr/bin/unicycler_check,/usr/bin/unicycler_polish,/usr/bin/unicycler_scrub" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y unicycler || apt-get install -y unicycler) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
