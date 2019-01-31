################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="cava"
LABEL software.version="1.1.1"
LABEL about.summary="lightweight, fast and flexible NGS variant annotation tool"
LABEL about.home="http://www.well.ox.ac.uk/cava"
LABEL about.documentation="http://www.well.ox.ac.uk/cava"
LABEL about.license_file="http://www.well.ox.ac.uk/cava"
LABEL about.license="SPDX:GPL-3.0"
LABEL about.tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

USER root

RUN pip install pysam==0.8.3

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

WORKDIR /data/
