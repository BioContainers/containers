#################################################################
# Dockerfile
#
# Version:          1
# Software:         cava
# Software Version: 1.1.1
# Description:      CAVA (Clinical Annotation of Variants) is a lightweight, fast and flexible Next Generation Sequencing (NGS) variant annotation tool
# Website:          http://www.well.ox.ac.uk/cava
# Tags:             Genomics
# Provides:         cava full 1.1.1|pysan 0.8.3
# Base Image:       biodckrdev/biodocker
# Build Cmd:        docker build biodckrdev/cava 1.1.1/.
# Pull Cmd:         docker pull biodckrdev/cava
# Run Cmd:          docker run biodckrdev/cava cava
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root

RUN pip install pysam==0.8.3

# Change user to back to biodocker
USER biodocker

ENV ZIP=cava-full-v1.1.1.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/cava
ENV FOLDER=cava-v1.1.1
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar xvf $DST/$ZIP -C $DST && \
  rm $DST/$ZIP && \
  cd $DST/$FOLDER && \
  sed -i -e 's#human_g1k_v37.fasta#'$DST/$FOLDER'/human_g1k_v37.fasta#;s#hg19.fa#'$DST/$FOLDER'/hg19.fa#;s#exome_65_GRCh37.gz#'$DST/$FOLDER'/exome_65_GRCh37.gz#;s#dbSNP138.gz#.#' $DST/$FOLDER/config.txt

ENV PATH=$PATH:/home/biodocker/bin/cava-v1.1.1/

# CHANGE WORKDIR TO /DATA
WORKDIR /data/

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 01-26-2016
