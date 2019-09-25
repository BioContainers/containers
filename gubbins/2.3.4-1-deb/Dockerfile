FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gubbins" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gubbins" \ 
    about.summary="phylogenetic analysis of genome sequences" \ 
    about.home="https://sanger-pathogens.github.io/gubbins/" \ 
    software.version="2.3.4-1-deb" \ 
    upstream.version="2.3.4" \ 
    version="1" \ 
    about.copyright="2012-2014 Nicholas Croucher <n.croucher@imperial.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gubbins/copyright" \ 
    extra.binaries="/usr/bin/gubbins_drawer,/usr/bin/run_gubbins" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gubbins || apt-get install -y gubbins) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
