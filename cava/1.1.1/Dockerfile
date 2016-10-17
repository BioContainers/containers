# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="cava"
LABEL software.version="1.1.1"
LABEL description="lightweight, fast and flexible NGS variant annotation tool"
LABEL website="http://www.well.ox.ac.uk/cava"
LABEL documentation="http://www.well.ox.ac.uk/cava"
LABEL license="http://www.well.ox.ac.uk/cava"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

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
