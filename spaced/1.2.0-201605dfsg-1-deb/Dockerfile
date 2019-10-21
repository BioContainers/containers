FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spaced" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="spaced" \ 
    about.summary="alignment-free sequence comparison using spaced words" \ 
    about.home="http://spaced.gobics.de/" \ 
    software.version="1.2.0-201605dfsg-1-deb" \ 
    upstream.version="1.2.0" \ 
    version="1" \ 
    about.copyright=" 2015 Lars Hahn <lars.hahn@stud.uni-goettingen.de>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/spaced/copyright" \ 
    extra.binaries="/usr/bin/spaced" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y spaced || apt-get install -y spaced) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
