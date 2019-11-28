FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="scythe" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="scythe" \ 
    about.summary="Bayesian adaptor trimmer for sequencing reads" \ 
    about.home="https://github.com/vsbuffalo/scythe" \ 
    software.version="0.994git20141017.20d3cff-1-deb" \ 
    upstream.version="0.994" \ 
    version="1" \ 
    about.copyright="2011 Vince Buffalo" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/scythe/copyright" \ 
    extra.binaries="/usr/bin/scythe" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y scythe || apt-get install -y scythe) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
