FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="samblaster" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="samblaster" \ 
    about.summary="marks duplicates, extracts discordant/split reads" \ 
    about.home="https://github.com/GregoryFaust/samblaster" \ 
    software.version="0.1.24-2-deb" \ 
    upstream.version="0.1.24" \ 
    version="1" \ 
    extra.identifiers.biotools="samblaster" \ 
    about.copyright="2013-2016 Gregory G. Faust <gf4ea@virginia.edu>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/samblaster/copyright" \ 
    extra.binaries="/usr/bin/samblaster" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y samblaster || apt-get install -y samblaster) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
