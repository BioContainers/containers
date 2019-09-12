FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastdnaml" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fastdnaml" \ 
    about.summary="Tool for construction of phylogenetic trees of DNA sequences" \ 
    about.home="ftp://ftp.bio.indiana.edu/molbio/evolve/fastdnaml/fastDNAml.html" \ 
    software.version="1.2.2-14-deb" \ 
    upstream.version="1.2.2" \ 
    version="1" \ 
    about.copyright="1998-2000 Gary J. Olsen <gary@phylo.life.uiuc.edu>," \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/fastdnaml/copyright" \ 
    extra.binaries="/usr/bin/fastDNAml,/usr/bin/fastDNAml-util" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::TODO, works-with-format::plaintext,:TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fastdnaml || apt-get install -y fastdnaml) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
