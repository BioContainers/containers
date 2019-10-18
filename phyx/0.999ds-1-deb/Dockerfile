FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phyx" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="phyx" \ 
    about.summary="UNIX-style phylogenetic analyses on trees and sequences" \ 
    about.home="https://github.com/FePhyFoFum/phyx" \ 
    software.version="0.999ds-1-deb" \ 
    upstream.version="0.999" \ 
    version="1" \ 
    extra.identifiers.biotools="phyx" \ 
    about.copyright="2014-2017 Joseph W. Brown, Joseph F. Walker, and Stephen A. Smith" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/phyx/copyright" \ 
    extra.binaries="/usr/bin/pxaa2cdn,/usr/bin/pxbdfit,/usr/bin/pxbdsim,/usr/bin/pxboot,/usr/bin/pxbp,/usr/bin/pxcat,/usr/bin/pxclsq,/usr/bin/pxcltr,/usr/bin/pxcolt,/usr/bin/pxconsq,/usr/bin/pxcontrates,/usr/bin/pxfqfilt,/usr/bin/pxlog,/usr/bin/pxlssq,/usr/bin/pxlstr,/usr/bin/pxmrca,/usr/bin/pxmrcacut,/usr/bin/pxmrcaname,/usr/bin/pxnj,/usr/bin/pxnw,/usr/bin/pxrecode,/usr/bin/pxrevcomp,/usr/bin/pxrls,/usr/bin/pxrlt,/usr/bin/pxrmk,/usr/bin/pxrms,/usr/bin/pxrmt,/usr/bin/pxrr,/usr/bin/pxs2fa,/usr/bin/pxs2nex,/usr/bin/pxs2phy,/usr/bin/pxseqgen,/usr/bin/pxssort,/usr/bin/pxsstat,/usr/bin/pxstrec,/usr/bin/pxsw,/usr/bin/pxt2new,/usr/bin/pxtcol,/usr/bin/pxtcomb,/usr/bin/pxtlate,/usr/bin/pxtrt,/usr/bin/pxtscale,/usr/bin/pxupgma,/usr/bin/pxvcf2fa" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y phyx || apt-get install -y phyx) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
