FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="prime-phylo" \ 
    container="prime-phylo" \ 
    about.summary="bayesian estimation of gene trees taking the species tree into account" \ 
    about.home="http://prime.sbc.su.se" \ 
    software.version="1.0.11-4b3-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/prime-phylo/copyright" \ 
    extra.binaries="/usr/bin/chainsaw,/usr/bin/mcmc_analysis,/usr/bin/primeDLRS,/usr/bin/primeDTLSR,/usr/bin/primeGEM,/usr/bin/primeGSRf,/usr/bin/reconcile,/usr/bin/reroot,/usr/bin/showtree,/usr/bin/tree2leafnames,/usr/bin/treesize" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y prime-phylo && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
