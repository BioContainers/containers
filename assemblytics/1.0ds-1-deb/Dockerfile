FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="assemblytics" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="assemblytics" \ 
    about.summary="detect and analyze structural variants from a genome assembly" \ 
    about.home="http://assemblytics.com/" \ 
    software.version="1.0ds-1-deb" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    about.copyright="2016 Maria Nattestad <mnattest@cshl.edu>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/assemblytics/copyright" \ 
    extra.binaries="/usr/bin/Assemblytics" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y assemblytics || apt-get install -y assemblytics) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
