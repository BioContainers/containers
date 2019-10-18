FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="paml" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="paml" \ 
    about.summary="Phylogenetic Analysis by Maximum Likelihood (PAML)" \ 
    about.home="http://abacus.gene.ucl.ac.uk/software/paml.html" \ 
    software.version="4.9hdfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="paml" \ 
    about.copyright="1992-2016 Ziheng Yang" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/paml/copyright" \ 
    extra.binaries="/usr/bin/baseml,/usr/bin/basemlg,/usr/bin/chi2,/usr/bin/codeml,/usr/bin/mcmctree,/usr/bin/paml-evolver,/usr/bin/pamp,/usr/bin/yn00" \ 
    about.tags="role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y paml || apt-get install -y paml) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
