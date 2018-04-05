FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mauve-aligner" \ 
    container="mauve-aligner" \ 
    about.summary="multiple genome alignment" \ 
    about.home="http://darlinglab.org/mauve/" \ 
    software.version="2.4.04734-3-deb" \ 
    version="1" \ 
    about.copyright="2003 - 2014 Aaron Darling -- darling@cs.wisc.edu" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mauve-aligner/copyright" \ 
    extra.binaries="/usr/bin/mauve" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mauve-aligner && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
