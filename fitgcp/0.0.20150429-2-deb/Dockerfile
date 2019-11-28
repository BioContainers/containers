FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fitgcp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fitgcp" \ 
    about.summary="fitting genome coverage distributions with mixture models" \ 
    about.home="http://sourceforge.net/projects/fitgcp/" \ 
    software.version="0.0.20150429-2-deb" \ 
    upstream.version="0.0.20150429" \ 
    version="1" \ 
    about.copyright="2012-2013 Martin S. Lindner and Maximilian Kollock" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/fitgcp/copyright" \ 
    extra.binaries="/usr/bin/fitgcp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fitgcp || apt-get install -y fitgcp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
