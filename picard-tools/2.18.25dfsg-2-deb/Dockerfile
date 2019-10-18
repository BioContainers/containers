FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="picard-tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="picard-tools" \ 
    about.summary="Command line tools to manipulate SAM and BAM files" \ 
    about.home="http://broadinstitute.github.io/picard/" \ 
    software.version="2.18.25dfsg-2-deb" \ 
    upstream.version="2.18.25" \ 
    version="1" \ 
    about.copyright=" 2009-2018 The Broad Institute" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/picard-tools/copyright" \ 
    extra.binaries="/usr/bin/PicardCommandLine,/usr/bin/picard-tools" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y picard-tools || apt-get install -y picard-tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
