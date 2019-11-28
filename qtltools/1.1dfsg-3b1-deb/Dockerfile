FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qtltools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="qtltools" \ 
    about.summary="Tool set for molecular QTL discovery and analysis" \ 
    about.home="https://qtltools.github.io/qtltools/" \ 
    software.version="1.1dfsg-3b1-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/qtltools/copyright" \ 
    about.license_file="/usr/share/doc/qtltools/copyright" \ 
    extra.binaries="/usr/bin/QTLtools" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y qtltools || apt-get install -y qtltools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
