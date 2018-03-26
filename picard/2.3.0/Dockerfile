################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="2"
LABEL software="Picard"
LABEL software.version="2.3.0"
LABEL about.summary="A set of Java command line tools for manipulating high-throughput sequencing (HTS) data and formats."
LABEL about.home="https://github.com/picard/picard"
LABEL about.documentation="https://github.com/picard/picard"
LABEL license="https://github.com/picard/picard"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

RUN conda install picard=2.3.0

WORKDIR /data/
