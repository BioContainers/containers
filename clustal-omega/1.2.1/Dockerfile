################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="5"
LABEL software="clustal-omega"
LABEL software.version="1.2.1"
LABEL about.summary="general purpose multiple sequence alignment program for proteins"
LABEL about.home="http://www.clustal.org/omega/"
LABEL about.documentation="http://www.clustal.org/omega/#about.documentation"
LABEL about.license_file="http://www.clustal.org/omega/"
LABEL about.license="SPDX:GPL-2.0"
LABEL extra.identifiers.biotools="clustal_omega_ebi"
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
