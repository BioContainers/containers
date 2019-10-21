FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="predictnls" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="predictnls" \ 
    about.summary="prediction and analysis of protein nuclear localization signals" \ 
    about.home="http://rostlab.org/services/predictNLS/" \ 
    software.version="1.0.20-5-deb" \ 
    upstream.version="1.0.20" \ 
    version="1" \ 
    extra.identifiers.biotools="predictnls" \ 
    about.copyright="2010 Rajesh Nair <rajnair5@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/predictnls/copyright" \ 
    extra.binaries="/usr/bin/predictnls" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y predictnls || apt-get install -y predictnls) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
