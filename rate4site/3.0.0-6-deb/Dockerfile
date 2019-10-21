FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rate4site" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rate4site" \ 
    about.summary="detector of conserved amino-acid sites" \ 
    about.home="http://www.tau.ac.il/~itaymay/cp/rate4site.html" \ 
    software.version="3.0.0-6-deb" \ 
    upstream.version="3.0.0" \ 
    version="1" \ 
    about.copyright="2013 Nir Ben-Tal" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/rate4site/copyright" \ 
    extra.binaries="/usr/bin/rate4site,/usr/bin/rate4site_doublerep" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rate4site || apt-get install -y rate4site) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
