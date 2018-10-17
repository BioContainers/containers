FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spaced" \ 
    container="spaced" \ 
    about.summary="alignment-free sequence comparison using spaced words" \ 
    about.home="http://spaced.gobics.de/" \ 
    software.version="1.0.2dfsg-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/spaced/copyright" \ 
    extra.binaries="/usr/bin/spaced" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y spaced && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
