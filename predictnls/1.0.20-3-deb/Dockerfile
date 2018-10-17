FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="predictnls" \ 
    container="predictnls" \ 
    about.summary="prediction and analysis of protein nuclear localization signals" \ 
    about.home="http://rostlab.org/services/predictNLS/" \ 
    software.version="1.0.20-3-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="predictnls" \ 
    about.copyright="2010 Rajesh Nair <rajnair5@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/predictnls/copyright" \ 
    extra.binaries="/usr/bin/predictnls" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y predictnls && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
