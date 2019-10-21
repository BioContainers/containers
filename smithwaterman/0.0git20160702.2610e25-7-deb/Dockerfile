FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="smithwaterman" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="smithwaterman" \ 
    about.summary="determine similar regions between two strings or genomic sequences" \ 
    about.home="https://github.com/ekg/smithwaterman" \ 
    software.version="0.0git20160702.2610e25-7-deb" \ 
    upstream.version="0.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/smithwaterman/copyright" \ 
    about.license_file="/usr/share/doc/smithwaterman/copyright" \ 
    extra.binaries="/usr/bin/smithwaterman" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y smithwaterman || apt-get install -y smithwaterman) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
