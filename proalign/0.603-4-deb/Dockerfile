FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="proalign" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="proalign" \ 
    about.summary="Probabilistic multiple alignment program" \ 
    about.home="http://ueg.ulb.ac.be/ProAlign/" \ 
    software.version="0.603-4-deb" \ 
    upstream.version="0.603" \ 
    version="1" \ 
    about.copyright=" 2002-2003 Ari Lytynoja and Michel C. Milinkovitch." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/proalign/copyright" \ 
    extra.binaries="/usr/bin/proalign" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y proalign || apt-get install -y proalign) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
