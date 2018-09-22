FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gubbins" \ 
    container="gubbins" \ 
    about.summary="phylogenetic analysis of genome sequences" \ 
    about.home="https://sanger-pathogens.github.io/gubbins/" \ 
    software.version="2.2.0-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2014 Nicholas Croucher <n.croucher@imperial.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gubbins/copyright" \ 
    extra.binaries="/usr/bin/gubbins_drawer,/usr/bin/run_gubbins" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gubbins && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
