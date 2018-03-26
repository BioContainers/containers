################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="bcftools"
LABEL software.version="1.5"
LABEL about.summary="Bcftools is a program for variant calling and manipulating VCFs and BCFs"
LABEL about.home="https://samtools.github.io/bcftools/"
LABEL about.documentation="https://samtools.github.io/bcftools/"
LABEL about.license_file="https://github.com/samtools/bcftools/blob/develop/LICENSE"
LABEL about.tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install bcftools=1.5

WORKDIR /data/

CMD ["bcftools"]
