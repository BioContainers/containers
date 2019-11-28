FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="e-mem" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="e-mem" \ 
    about.summary="Efficient computation of Maximal Exact Matches for very large genomes" \ 
    about.home="http://www.csd.uwo.ca/~ilie/E-MEM/" \ 
    software.version="1.0.1-2-deb" \ 
    upstream.version="1.0.1" \ 
    version="1" \ 
    about.copyright="2013-2015 Nilesh Khiste and Lucian Ilie" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/e-mem/copyright" \ 
    extra.binaries="/usr/bin/e-mem" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y e-mem || apt-get install -y e-mem) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
