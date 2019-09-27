FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hunspell-de-med" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="hunspell-de-med" \ 
    about.summary="German medical dictionary for hunspell" \ 
    about.home="https://github.com/toddy15/medicalterms" \ 
    software.version="20160103-3-deb" \ 
    upstream.version="20160103" \ 
    version="1" \ 
    about.copyright=" 2005-2016 Dr. Tobias Quathamer <toddy@debian.org>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/hunspell-de-med/copyright" \ 
    about.tags="culture::german, field::medicine, made-of::dictionary, role::app-data,:checking" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y hunspell-de-med || apt-get install -y hunspell-de-med) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
