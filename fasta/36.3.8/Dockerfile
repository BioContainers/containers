################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################

LABEL base_image="biocontainers:latest"
LABEL version="1"
LABEL software="FASTA"
LABEL software.version="36.3.8"
LABEL about.summary="Protein and DNA sequence similarity searching and alignment programs"
LABEL about.home="http://faculty.virginia.edu/wrpearson/fasta"
LABEL about.documentation="http://faculty.virginia.edu/wrpearson/fasta/fasta_guide.pdf"
LABEL about.license_file="http://faculty.virginia.edu/wrpearson/fasta/readme.COPYRIGHT"
LABEL about.license="SPDX:Apache-2.0"
LABEL extra.identifiers.biotools="FASTA3"
LABEL about.tags="Genomics"

################## MAINTAINER ######################

MAINTAINER Fábio Madeira <fabiomadeira@me.com>

################## INSTALLATION ######################

RUN conda install fasta3=36.3.8

WORKDIR /data/
USER biodocker
