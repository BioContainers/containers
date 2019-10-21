FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="scrm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="scrm" \ 
    about.summary="simulator of evolution of genetic sequences" \ 
    about.home="https://github.com/scrm/scrm" \ 
    software.version="1.7.3-1-deb" \ 
    upstream.version="1.7.3" \ 
    version="1" \ 
    about.copyright="2013, 2014 Paul R. Staab, Sha (Joe) Zhu, Dirk Metzler and Gerton Lunter" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/scrm/copyright" \ 
    extra.binaries="/usr/bin/scrm" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y scrm || apt-get install -y scrm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
