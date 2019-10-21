FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rambo-k" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rambo-k" \ 
    about.summary="Read Assignment Method Based On K-mers" \ 
    about.home="http://rambok.sourceforge.net/" \ 
    software.version="1.21dfsg-2-deb" \ 
    upstream.version="1.21" \ 
    version="1" \ 
    extra.identifiers.biotools="rambo-k" \ 
    about.copyright=" 2013-2015 Simon Tausch <TauschS@rki.de>" \ 
    about.license="LGPL-3" \ 
    about.license_file="/usr/share/doc/rambo-k/copyright" \ 
    extra.binaries="/usr/bin/rambo-k" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rambo-k || apt-get install -y rambo-k) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
