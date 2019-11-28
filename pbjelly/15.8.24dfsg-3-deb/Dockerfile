FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbjelly" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbjelly" \ 
    about.summary="genome assembly upgrading tool" \ 
    about.home="http://sourceforge.net/projects/pb-jelly" \ 
    software.version="15.8.24dfsg-3-deb" \ 
    upstream.version="15.8.24" \ 
    version="1" \ 
    about.copyright="2013 Baylor College of Medicine" \ 
    about.license="BSD-2-Clause" \ 
    about.license_file="/usr/share/doc/pbjelly/copyright" \ 
    extra.binaries="/usr/bin/Jelly,/usr/bin/Jelly.py" \ 
    extra.identifiers.doi="10.1371/journal.pone.0047768" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pbjelly || apt-get install -y pbjelly) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
