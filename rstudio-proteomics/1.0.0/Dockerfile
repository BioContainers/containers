
################## BASE IMAGE ######################

FROM bioconductor/release_core

################## METADATA ######################

LABEL base_image="bioconductor/release_core"
LABEL version="1"
LABEL software="RProteomics"
LABEL software.version="1"
LABEL about.summary="Rstudio-Proteomics is an adaptation from the original images provided by the Rocker-org. The container provided here contains a Rstudio server configurated with several packages dedicated to Proteomcis data analysis.Rstudio-Proteomics is an adaptation from the original images provided by the Rocker-org. The container provided here contains a Rstudio server configurated with several packages dedicated to Proteomcis data analysis."
LABEL about.home="https://github.com/rocker-org"
LABEL about.documentation="https://github.com/rocker-org"
LABEL about.license_file="https://github.com/rocker-org"
LABEL about.license="SPDX:Apache-2.0"
LABEL about.tags="Genomics, Proteomics, Transcriptomics, Metabolomics, General"

################## INSTALLATION ###########################

USER root

# nuke cache dirs before installing pkgs; tip from Dirk E fixes broken img
RUN rm -f /var/lib/dpkg/available && rm -rf  /var/cache/apt/* && \
  apt-get install -y -t unstable --force-yes libfreetype6 && \
  apt-get update && \
  apt-get install -y -t unstable \
  libexpat1-dev \
  libgmp3-dev \
  libnetcdf-dev \
  libopenbabel-dev \
  libgl1-mesa-dev \
  libglu1-mesa-dev \
  libgsl0-dev \
  libgsl0ldbl \
  openjdk-8-jdk && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN R CMD javareconf

ENV NETCDF_INCLUDE=/usr/include

ADD startx.sh /tmp/

ADD installFromBiocViews.R /tmp/

# invalidates cache every 24 hours
ADD http://master.bioconductor.org/todays-date /tmp/

RUN cd /tmp && \
  ./startx.sh && \
  export DISPLAY=:1.0 && \
  R -f /tmp/installFromBiocViews.R && \
  R -e "biocLite(c('rols', 'RforProteomics'))"

USER biodocker

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 01-26-2016
# Adapted from the original work of dtenenba@fredhutch.org (rocker-org)
