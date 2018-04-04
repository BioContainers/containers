FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="picard-tools" \ 
    container="picard-tools" \ 
    about.summary="Command line tools to manipulate SAM and BAM files" \ 
    about.home="http://broadinstitute.github.io/picard/" \ 
    software.version="2.8.1dfsg-1-deb" \ 
    version="1" \ 
    about.copyright=" 20092014 The Broad Institute" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/picard-tools/copyright" \ 
    extra.binaries="/usr/bin/PicardCommandLine,/usr/bin/picard-tools" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y picard-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
