FROM debian:bookworm-slim

###################################### METADATA ##############################
LABEL base_image="biocontainers:latest" \
  software="hsfiasm" \
  software.version="0.19.9"
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

ARG URL=https://github.com/chhylp123/hifiasm/archive/refs/tags/
ARG VER=0.19.9
# https://github.com/chhylp123/hifiasm/archive/refs/tags/0.19.9.tar.gz
RUN wget ${URL}${VER}.tar.gz && \
    tar xvfz ${VER}.tar.gz && \
    rm ${VER}.tar.gz && \
    cd hifiasm-${VER} && \
    make
