# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="3"
LABEL software="clustal-omega"
LABEL software.version="1.2.1-1"
LABEL description="general purpose multiple sequence alignment program for proteins"
LABEL website="http://www.clustal.org/omega/"
LABEL documentation="http://www.clustal.org/omega/#Documentation"
LABEL license="http://www.clustal.org/omega/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

RUN apt-get update && \
  apt-get install -y \
  clustalo && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

WORKDIR /data/
