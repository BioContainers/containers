FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sspace" \ 
    container="sspace" \ 
    about.summary="scaffolding pre-assembled contigs after extension" \ 
    about.home="https://github.com/nsoranzo/sspace_basic" \ 
    software.version="2.1.1dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="sspace" \ 
    about.copyright="2010 Marten Boetzer and Walter Pirovano <walter.pirovano@baseclear.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/sspace/copyright" \ 
    extra.binaries="/usr/bin/sspace" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sspace && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
