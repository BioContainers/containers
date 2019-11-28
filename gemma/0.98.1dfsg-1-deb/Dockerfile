FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gemma" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gemma" \ 
    about.summary="Genome-wide Efficient Mixed Model Association" \ 
    about.home="http://www.xzlab.org/software.html" \ 
    software.version="0.98.1dfsg-1-deb" \ 
    upstream.version="0.98.1" \ 
    version="1" \ 
    extra.identifiers.biotools="gemma" \ 
    about.copyright="2012-2017 Xiang Zhou <xiang.zhou.email@gmail.com>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/gemma/copyright" \ 
    extra.binaries="/usr/bin/gemma" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gemma || apt-get install -y gemma) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
