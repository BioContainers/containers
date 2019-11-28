FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tm-align" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="tm-align" \ 
    about.summary="structural alignment of proteins" \ 
    about.home="http://zhanglab.ccmb.med.umich.edu/TM-align/" \ 
    software.version="20170708dfsg-2-deb" \ 
    upstream.version="20170708" \ 
    version="1" \ 
    about.copyright=" 2005-2012 Yang Zhang, Jeffrey Skolnick" \ 
    about.license="other" \ 
    about.license_file="/usr/share/doc/tm-align/copyright" \ 
    extra.binaries="/usr/bin/TMalign,/usr/bin/TMscore" \ 
    about.tags="role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y tm-align || apt-get install -y tm-align) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
