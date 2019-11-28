FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="maude" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="maude" \ 
    about.summary="high-performance logical framework" \ 
    about.home="http://maude.cs.uiuc.edu" \ 
    software.version="2.7-2b2-deb" \ 
    upstream.version="2.7" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/maude/copyright" \ 
    about.license_file="/usr/share/doc/maude/copyright" \ 
    extra.binaries="/usr/bin/maude" \ 
    about.tags="uitoolkit::ncurses" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y maude || apt-get install -y maude) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
