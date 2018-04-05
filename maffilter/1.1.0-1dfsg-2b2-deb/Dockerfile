FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="maffilter" \ 
    container="maffilter" \ 
    about.summary="process genome alignment in the Multiple Alignment Format" \ 
    about.home="http://biopp.univ-montp2.fr/forge/maffilter" \ 
    software.version="1.1.0-1dfsg-2b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/maffilter/copyright" \ 
    extra.binaries="/usr/bin/maffilter" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y maffilter && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
