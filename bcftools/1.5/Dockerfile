################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################

LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="bcftools"
LABEL software.version="1.5"
LABEL about.summary="Bcftools is a program for variant calling and manipulating VCFs and BCFs"
LABEL about.home="https://samtools.github.io/bcftools/"
LABEL about.documentation="https://samtools.github.io/bcftools/"
LABEL about.license_file="https://github.com/samtools/bcftools/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL extra.identifiers.biotools="bcftools"
LABEL about.tags="Genomics"
LABEL extra.binaries="bcftools"

################## MAINTAINER ######################

MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

RUN conda install bcftools=1.5

WORKDIR /data/

# CMD ["bcftools"]
