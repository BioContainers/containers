FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bcbio" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bcbio" \ 
    about.summary="library for analysing high-throughput sequencing data" \ 
    about.home="https://github.com/chapmanb/bcbio-nextgen" \ 
    software.version="1.1.2-3-deb-py3" \ 
    upstream.version="1.1.2" \ 
    version="1" \ 
    about.copyright="2013-2018 bcbio-nextgen contributors" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/bcbio/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-bcbio || apt-get install -y python3-bcbio) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
