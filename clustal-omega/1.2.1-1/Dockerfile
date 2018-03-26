################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="3"
LABEL software="clustal-omega"
LABEL software.version="1.2.1-1"
LABEL about.summary="general purpose multiple sequence alignment program for proteins"
LABEL about.home="http://www.clustal.org/omega/"
LABEL about.documentation="http://www.clustal.org/omega/#about.documentation"
LABEL license="http://www.clustal.org/omega/"
LABEL about.tags="Proteomics"

################## MAINTAINER ######################
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

################## INSTALLATION ######################

USER root

RUN apt-get update && \
  apt-get install -y \
  clustalo && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

WORKDIR /data/
