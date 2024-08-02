FROM debian:bookworm-slim

###################################### METADATA ##############################
LABEL base_image="debian:bookworm-slim" \
  software="gfatools" \
  software.version="final-gt"
#  about.summary="The Genome Analysis Toolkit or GATK is a software package developed at the Broad Institute to analyze high-throughput sequencing data." \
#  about.home="https://www.broadinstitute.org/gatk/|https://github.com/broadgsa/gatk-protected/" \
#  about.license_file="https://github.com/broadgsa/gatk-protected/blob/master/licensing/protected_license.txt" \
#  about.license="SPDX:BSD-3-Clause" \
#  about.tags="Genomics" 
ENV DEBIAN_FRONTEND=noninteractive
################## BEGIN INSTALLATION #######################
USER root

RUN apt-get update -qq && \
    apt-get install -y -q --fix-missing \
      libncurses5-dev  \
      libncursesw5-dev \
      build-essential \
      wget \
      zlib1g-dev && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /data /config

ARG URL=https://github.com/lh3/gfatools/archive/refs/tags/
ARG VER=final-gt
ARG PRGNAME=gfatools
# https://github.com/lh3/gfatools/archive/refs/tags/final-gt.tar.gz
RUN wget ${URL}${VER}.tar.gz && \
    tar xvfz ${VER}.tar.gz && \
    rm ${VER}.tar.gz && \
    cd ${PRGNAME}-${VER} && \
    make
