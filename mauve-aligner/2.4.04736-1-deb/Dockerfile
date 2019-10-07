FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mauve-aligner" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mauve-aligner" \ 
    about.summary="multiple genome alignment" \ 
    about.home="http://darlinglab.org/mauve/" \ 
    software.version="2.4.04736-1-deb" \ 
    upstream.version="2.4.0" \ 
    version="1" \ 
    about.copyright="2003 - 2014 Aaron Darling -- darling@cs.wisc.edu" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mauve-aligner/copyright" \ 
    extra.binaries="/usr/bin/mauve,/usr/bin/mauve-contig-mover" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mauve-aligner || apt-get install -y mauve-aligner) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
