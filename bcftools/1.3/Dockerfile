# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="bcftools"
LABEL software.version="1.3"
LABEL description="Bcftools is a program for variant calling and manipulating VCFs and BCFs"
LABEL website="https://samtools.github.io/bcftools/"
LABEL documentation="https://samtools.github.io/bcftools/"
LABEL license="https://samtools.github.io/bcftools/"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install bcftools=1.3

WORKDIR /data/

CMD ["bcftools"]
