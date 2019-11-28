FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mcl" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mcl" \ 
    about.summary="Markov Cluster algorithm" \ 
    about.home="http://micans.org/mcl/" \ 
    software.version="1-14-137ds-3-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="mcl" \ 
    about.copyright=" 1999-2007 Stijn van Dongen <stijn@micans.org>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/mcl/copyright" \ 
    extra.binaries="/usr/bin/clm,/usr/bin/clmformat,/usr/bin/clxdo,/usr/bin/mcl,/usr/bin/mclblastline,/usr/bin/mclcm,/usr/bin/mclpipeline,/usr/bin/mcx,/usr/bin/mcxarray,/usr/bin/mcxassemble,/usr/bin/mcxdeblast,/usr/bin/mcxdump,/usr/bin/mcxi,/usr/bin/mcxload,/usr/bin/mcxmap,/usr/bin/mcxrand,/usr/bin/mcxsubs" \ 
    about.tags="field::mathematics, implemented-in::c, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mcl || apt-get install -y mcl) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
