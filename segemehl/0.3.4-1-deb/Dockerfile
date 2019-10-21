FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="segemehl" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="segemehl" \ 
    about.summary="short read mapping with gaps" \ 
    about.home="http://www.bioinf.uni-leipzig.de/Software/segemehl/" \ 
    software.version="0.3.4-1-deb" \ 
    upstream.version="0.3.4" \ 
    version="1" \ 
    extra.identifiers.biotools="segemehl" \ 
    about.copyright="2008-2018 Bioinformatik Leipzig" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/segemehl/copyright" \ 
    extra.binaries="/usr/bin/haarz,/usr/bin/segemehl" \ 
    about.tags="uitoolkit::ncurses" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y segemehl || apt-get install -y segemehl) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
