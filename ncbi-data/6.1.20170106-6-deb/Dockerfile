FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncbi-data" \ 
    about.summary="Platform-independent data for the NCBI toolkit" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/" \ 
    software.version="6.1.20170106-6-deb" \ 
    upstream.version="6.1.20170106" \ 
    version="1" \ 
    about.copyright="1996-2017 NCBI" \ 
    about.license="public_domain" \ 
    about.license_file="/usr/share/doc/ncbi-data/copyright" \ 
    extra.binaries="/usr/bin/vibrate" \ 
    about.tags="role::shared-lib" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncbi-data || apt-get install -y ncbi-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
