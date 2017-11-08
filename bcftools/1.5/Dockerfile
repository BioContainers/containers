################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="bcftools"
LABEL software.version="1.5"
LABEL description="Bcftools is a program for variant calling and manipulating VCFs and BCFs"
LABEL website="https://samtools.github.io/bcftools/"
LABEL documentation="https://samtools.github.io/bcftools/"
LABEL license="https://samtools.github.io/bcftools/"
LABEL tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install bcftools=1.5

WORKDIR /data/

CMD ["bcftools"]
