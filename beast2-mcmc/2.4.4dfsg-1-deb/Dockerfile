FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="beast2-mcmc" \ 
    container="beast2-mcmc" \ 
    about.summary="Bayesian MCMC phylogenetic inference" \ 
    about.home="http://www.beast2.org" \ 
    software.version="2.4.4dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2002-2011 Alexei Drummond and Andrew Rambaut" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/beast2-mcmc/copyright" \ 
    extra.binaries="/usr/bin/beast2-mcmc,/usr/bin/beauti2,/usr/bin/treeannotator2" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y beast2-mcmc && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
