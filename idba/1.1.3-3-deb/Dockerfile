FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="idba" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="idba" \ 
    about.summary="iterative De Bruijn Graph short read assemblers" \ 
    about.home="https://github.com/loneknightpy/idba" \ 
    software.version="1.1.3-3-deb" \ 
    upstream.version="1.1.3" \ 
    version="1" \ 
    extra.identifiers.biotools="idba" \ 
    about.copyright="2009-2013 Yu Peng <ypeng@cs.hku.hk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/idba/copyright" \ 
    extra.binaries="/usr/bin/idba,/usr/bin/idba_hybrid,/usr/bin/idba_tran,/usr/bin/idba_ud" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y idba || apt-get install -y idba) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
