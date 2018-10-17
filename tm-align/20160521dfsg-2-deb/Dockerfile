FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tm-align" \ 
    container="tm-align" \ 
    about.summary="structural alignment of proteins" \ 
    about.home="http://zhanglab.ccmb.med.umich.edu/TM-align/" \ 
    software.version="20160521dfsg-2-deb" \ 
    version="1" \ 
    about.copyright=" 2005-2012 Yang Zhang, Jeffrey Skolnick" \ 
    about.license="other" \ 
    about.license_file="/usr/share/doc/tm-align/copyright" \ 
    extra.binaries="/usr/bin/TMalign,/usr/bin/TMscore" \ 
    about.tags="role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tm-align && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
