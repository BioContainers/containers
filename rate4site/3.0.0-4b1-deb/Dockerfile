FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rate4site" \ 
    container="rate4site" \ 
    about.summary="detector of conserved amino-acid sites" \ 
    about.home="http://www.tau.ac.il/~itaymay/cp/rate4site.html" \ 
    software.version="3.0.0-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/rate4site/copyright" \ 
    extra.binaries="/usr/bin/rate4site,/usr/bin/rate4site_doublerep" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y rate4site && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
