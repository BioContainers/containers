FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="beast-mcmc" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="beast-mcmc" \ 
    about.summary="Bayesian MCMC phylogenetic inference" \ 
    about.home="http://beast.bio.ed.ac.uk/" \ 
    software.version="1.10.4dfsg-1-deb" \ 
    upstream.version="1.10.4" \ 
    version="1" \ 
    about.copyright="2002-2015 Alexei Drummond and Andrew Rambaut" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/beast-mcmc/copyright" \ 
    extra.binaries="/usr/bin/beast-mcmc,/usr/bin/beast-tracer,/usr/bin/beauti,/usr/bin/loganalyser,/usr/bin/logcombiner,/usr/bin/treeannotator,/usr/bin/treestat" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y beast-mcmc || apt-get install -y beast-mcmc) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
