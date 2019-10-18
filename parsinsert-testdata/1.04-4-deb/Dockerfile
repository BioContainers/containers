FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="parsinsert-testdata" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="parsinsert-testdata" \ 
    about.summary="Test data for parsinsert" \ 
    about.home="http://sourceforge.net/projects/parsinsert/" \ 
    software.version="1.04-4-deb" \ 
    upstream.version="1.04" \ 
    version="1" \ 
    about.copyright=" 2007-2011 David Knox" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/parsinsert-testdata/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y parsinsert-testdata || apt-get install -y parsinsert-testdata) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
