FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="conservation-code" \ 
    container="conservation-code" \ 
    about.summary="protein sequence conservation scoring tool" \ 
    about.home="http://compbio.cs.princeton.edu/conservation/" \ 
    software.version="20110309.0-5-deb" \ 
    version="1" \ 
    about.copyright="Tony Capra 2007" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/conservation-code/copyright" \ 
    extra.binaries="/usr/bin/score_conservation" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y conservation-code && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
