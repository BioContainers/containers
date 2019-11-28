FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="lagan" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="lagan" \ 
    about.summary="highly parametrizable pairwise global genome sequence aligner" \ 
    about.home="http://lagan.stanford.edu/lagan_web/index.shtml" \ 
    software.version="2.0-3-deb" \ 
    upstream.version="2.0" \ 
    version="1" \ 
    extra.identifiers.biotools="lagan" \ 
    about.copyright=" 2003-2006 Michael Brudno, Chuong Do, et. al." \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/lagan/copyright" \ 
    extra.binaries="/usr/bin/anal_gloc.pl,/usr/bin/anchors,/usr/bin/glocal,/usr/bin/lagan.pl,/usr/bin/lagan_chaos,/usr/bin/mlagan,/usr/bin/order,/usr/bin/prolagan,/usr/bin/rechaos.pl,/usr/bin/slagan-mfa.pl,/usr/bin/slagan.pl,/usr/bin/supermap.pl,/usr/bin/xmfa2mfa.pl" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y lagan || apt-get install -y lagan) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
