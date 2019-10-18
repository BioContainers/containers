FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pftools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pftools" \ 
    about.summary="build and search protein and DNA generalized profiles" \ 
    about.home="http://web.expasy.org/pftools/" \ 
    software.version="3dfsg-3-deb" \ 
    upstream.version="3" \ 
    version="1" \ 
    extra.identifiers.biotools="pftools" \ 
    about.copyright="2002-2011 Alan Bridge, Christian Sigrist, Gregoire Rossier" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/pftools/copyright" \ 
    extra.binaries="/usr/bin/2ft,/usr/bin/6ft,/usr/bin/pfdump,/usr/bin/pfgtop,/usr/bin/pfhtop,/usr/bin/pfmake,/usr/bin/pfscale,/usr/bin/pfscan,/usr/bin/pfsearch,/usr/bin/pfsearchV3,/usr/bin/pfw,/usr/bin/psa2msa,/usr/bin/ptof,/usr/bin/ptoh" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pftools || apt-get install -y pftools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
