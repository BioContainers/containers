#################################################################
# Dockerfile
#
# Version:          1
# Software:         Rstudio
# Software Version: ?
# Description:      Rstudio-Proteomics is an adaptation from the original images provided by the Rocker-org. The container provided here contains a Rstudio server configurated with several packages dedicated to Proteomcis data analysis.Rstudio-Proteomics is an adaptation from the original images provided by the Rocker-org. The container provided here contains a Rstudio server configurated with several packages dedicated to Proteomcis data analysis.
# Website:          https://github.com/rocker-org
# Tags:             Genomics|Proteomics|Transcriptomics|Metabolomics|General
# Provides:         Rstudio
# Base Image:       bioconductor/release_core
# Build Cmd:        docker build --rm -t biodckr/rstudio .
# Pull Cmd:         docker pull biodckr/rstudio
# Run Cmd:          docker run --rm  -p 8787:8787 biodckr/rstudio
# Extra:            The Rstudio will be available via browser at:
# Extra:            http://localhost:8787
# Extra:            user: rstudio
# Extra:            pass: rstudio
#################################################################

# Set the base image
FROM bioconductor/release_core

################## BEGIN INSTALLATION ###########################

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
# Adapted from the original work of dtenenba@fredhutch.org (rocker-org)
