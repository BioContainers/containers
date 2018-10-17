FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mcl" \ 
    container="mcl" \ 
    about.summary="Markov Cluster algorithm" \ 
    about.home="http://micans.org/mcl/" \ 
    software.version="1-14-137-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/mcl/copyright" \ 
    extra.binaries="/usr/bin/clm,/usr/bin/clmformat,/usr/bin/clxdo,/usr/bin/mcl,/usr/bin/mclblastline,/usr/bin/mclcm,/usr/bin/mclpipeline,/usr/bin/mcx,/usr/bin/mcxarray,/usr/bin/mcxassemble,/usr/bin/mcxdeblast,/usr/bin/mcxdump,/usr/bin/mcxi,/usr/bin/mcxload,/usr/bin/mcxmap,/usr/bin/mcxrand,/usr/bin/mcxsubs" \ 
    about.tags="field::mathematics, implemented-in::c, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mcl && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
