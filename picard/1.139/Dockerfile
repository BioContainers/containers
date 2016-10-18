# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="Picard"
LABEL software.version="1.139"
LABEL description="A set of Java command line tools for manipulating high-throughput sequencing (HTS) data and formats."
LABEL website="https://github.com/picard/picard"
LABEL documentation="https://github.com/picard/picard"
LABEL license="https://github.com/picard/picard"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install picard=1.139

WORKDIR /data/
