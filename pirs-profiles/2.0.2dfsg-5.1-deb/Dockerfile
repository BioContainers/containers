FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pirs-profiles" \ 
    container="pirs-profiles" \ 
    about.summary="profile basd Illumina pair-end Reads Simulator (profile data)" \ 
    about.home="https://github.com/galaxy001/pirs" \ 
    software.version="2.0.2dfsg-5.1-deb" \ 
    version="1" \ 
    about.copyright="2011-2016 BGI (http://en.genomics.cn/)" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/pirs-profiles/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pirs-profiles && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
