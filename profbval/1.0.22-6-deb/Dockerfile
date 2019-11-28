FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="profbval" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="profbval" \ 
    about.summary="predictor of flexible/rigid protein residues from sequence" \ 
    about.home="https://www.rostlab.org/owiki/index.php/PROFbval" \ 
    software.version="1.0.22-6-deb" \ 
    upstream.version="1.0.22" \ 
    version="1" \ 
    about.copyright="2005, 2006 Avner Schlessinger" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/profbval/copyright" \ 
    extra.binaries="/usr/bin/profbval" \ 
    about.tags="biology::nucleic-acids, field::biology, role::debug-symbols" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y profbval || apt-get install -y profbval) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
