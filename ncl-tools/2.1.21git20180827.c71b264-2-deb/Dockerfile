FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncl-tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncl-tools" \ 
    about.summary="tools to deal with NEXUS files" \ 
    about.home="https://github.com/mtholder/ncl" \ 
    software.version="2.1.21git20180827.c71b264-2-deb" \ 
    upstream.version="2.1.21" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ncl-tools/copyright" \ 
    about.license_file="/usr/share/doc/ncl-tools/copyright" \ 
    extra.binaries="/usr/bin/NCLconverter,/usr/bin/NEXUSnormalizer,/usr/bin/NEXUSvalidator,/usr/bin/checktaxonnodes,/usr/bin/findunsupportededges,/usr/bin/otTreeInspect,/usr/bin/otsubtree,/usr/bin/outdeg1count" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncl-tools || apt-get install -y ncl-tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
